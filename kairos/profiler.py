"""Profiler
Profiling package.
"""

import time
import numpy as np
import pandas as pd


def time_ns():
    return int(time.time() * 1e9)


def pretty_elapsed(elapsed):
    hours, rem = divmod(elapsed, 3600 * 1e9)
    minutes, rem = divmod(rem, 60 * 1e9)
    seconds, rem = divmod(rem, 1e9)
    milli, rem = divmod(rem, 1e6)
    micro, nano = divmod(rem, 1e3)
    return "{:0>2}:{:0>2}:{:0>2} {:0>3}:{:0>3}:{:0>3}".format(
        int(hours), int(minutes), int(seconds), int(milli), int(micro), int(nano))


class Profiler: 

    class Item: 
        def __init__(self, info, func, iter=None):
            self.info = info
            self.func = func
            self.iter = iter


    def __init__(self, iter=100, dump=True, debug=True):
        self.default_iter = iter
        self.dump = dump
        self.debug = debug


    def run(self, item: Item):
        
        if self.debug:
            print("=== Profiling: {};".format(item.info))

        iter = item.iter
        if iter is None:
            iter = self.default_iter

        duration_list = []
        for i in range(iter):
            t_start = time_ns()
            item.func()
            t_end = time_ns()
            d = t_end - t_start
            if self.debug: 
                print("iter {:4}: {}".format(i, pretty_elapsed(d)))
            duration_list.append(d * 1e-6) # to ms
        
        duration_list_np = np.array(duration_list)
        if self.debug:
            print("Summary [#ITER {:4}] mean: {:5.2f} ms, median: {:5.2f} ms, std: {:5.2f} ms".format(
                iter, np.mean(duration_list_np), np.median(duration_list_np), np.std(duration_list_np)))

        if self.dump:
            pd.DataFrame(duration_list_np, columns=["duration"]).to_csv(item.info + ".csv", index=False)


    def run_multi(self, item_list: list):
        for i in item_list: 
            self.run(i)


if __name__ == '__main__':
    def test1():
        time.sleep(5 * 1e-3)

    def test2():
        time.sleep(2 * 1e-3)

    p = Profiler(iter=10)
    p.run_multi([
        Profiler.Item("test1", test1, 20),
        Profiler.Item("test2", test2)
    ])
        


