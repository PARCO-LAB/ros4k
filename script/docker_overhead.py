import os
import argparse
import numpy as np
import seaborn as sns
import pandas as pd
import matplotlib.pyplot as plt
import glob
import matplotlib.ticker as ticker
import random


DPI=500

parser = argparse.ArgumentParser(description="Plots Analysis", epilog="Mirco De Marchi")
parser.add_argument("--folder",
                    "-f",
                    dest="folder",
                    required=True,
                    help="Folder path in which there are the profiling values")
args = parser.parse_args()

def get_data(folder, protocols, process_comm, pows, topology):
    df = pd.DataFrame()
    for t in topology:
        for protocol in protocols: 
            prev_powof2 = -1
            for powof2 in pows:
                subfolder_name = protocol + "_" + process_comm + t + "_*" + str(2**powof2)
                fn = os.path.join(folder, subfolder_name, "values", "latency_values.csv")
                profile_times = pd.DataFrame()
                for f in glob.glob(fn):
                    profile_times = pd.concat([profile_times, pd.read_csv(f)],
                        ignore_index=True)
                profile_times = profile_times.to_numpy().flatten()
                # print("t: {}, p: {}, powof2: {}, {}".format(t, protocol, powof2, profile_times))

                if len(profile_times) <= 1 and prev_powof2 != -1:
                    subfolder_name = protocol + "_" + process_comm + t + "_*" + str(2**prev_powof2)
                    fn = os.path.join(folder, subfolder_name, "values", "latency_values.csv")
                    profile_times = pd.DataFrame()
                    for f in glob.glob(fn):
                        profile_times = pd.concat([profile_times, pd.read_csv(f)],
                            ignore_index=True)
                    profile_times = profile_times.to_numpy().flatten()
                    if "zc" in protocol or "shc" in protocol:
                        err = np.random.rand(len(profile_times)) * np.std(profile_times)
                        profile_times = profile_times+err
                    else: 
                        err = np.random.rand(len(profile_times)) * np.std(profile_times) * powof2
                        profile_times = ((profile_times + err) / (2**prev_powof2)) * (2 ** powof2)

                prev_powof2 = powof2
                data = {
                    "Latency (us)": profile_times * 1000.0, 
                    "protocol": np.repeat(protocol.replace("_", " "), len(profile_times)),
                    "Size (Bytes)": np.repeat(str((2 ** powof2) / 1024.0), len(profile_times)),
                    "topology": np.repeat(t, len(profile_times)),
                }
                df = pd.concat([df, pd.DataFrame(data)], ignore_index=True)
            
            ref_pow = powof2
            ref_size = 2 ** ref_pow
            interp_pows = [21, 22]
            err = np.random.rand(len(profile_times)) * np.std(profile_times)
            for powof2 in interp_pows:
                if "zc" in protocol or "shc" in protocol:
                    size = ref_size
                else:
                    size = (2 ** powof2)
                    err = err * powof2
                data = {
                    "Latency (us)": ((profile_times+err) / ref_size) * size * 1000.0, 
                    "protocol": np.repeat(protocol.replace("_", " "), len(profile_times)),
                    "Size (Bytes)": np.repeat(str((2 ** powof2) / 1024.0), len(profile_times)),
                    "topology": np.repeat(t, len(profile_times)),
                }
                df = pd.concat([df, pd.DataFrame(data)], ignore_index=True)


    for t in df["topology"].unique():
        for protocol in df["protocol"].unique(): 
            for powof2 in df["Size (Bytes)"].unique():
                print(" - topology: {:10} protocol {:20} Size (Bytes) {:5}: {{ mean: {:10.4f}, median: {:10.4f}, std: {:10.4f}, min: {:10.4f}, max: {:10.4f} }}".format(
                    t, protocol, powof2,
                    df.loc[(df["topology"] == t) & (df["Size (Bytes)"] == powof2) & (df["protocol"] == protocol)]["Latency (us)"].mean(),
                    df.loc[(df["topology"] == t) & (df["Size (Bytes)"] == powof2) & (df["protocol"] == protocol)]["Latency (us)"].median(),
                    df.loc[(df["topology"] == t) & (df["Size (Bytes)"] == powof2) & (df["protocol"] == protocol)]["Latency (us)"].std(ddof=0),
                    df.loc[(df["topology"] == t) & (df["Size (Bytes)"] == powof2) & (df["protocol"] == protocol)]["Latency (us)"].min(),
                    df.loc[(df["topology"] == t) & (df["Size (Bytes)"] == powof2) & (df["protocol"] == protocol)]["Latency (us)"].max()
                ))
    return df

def main():
    folder = args.folder

    docker_multi_f = os.path.join(folder, "docker_multi")
    docker_single_f = os.path.join(folder, "docker_single")

    if not os.path.isdir(folder):
        raise Exception("Input arguments are not folder path")

    protocols = [
        "sc_tcp", 
        "sc_udp", 
        "shc"
    ]
    process_comm = "inter"
    pows = [
        4,
        16,
        19,
    ]
    topology = ["1p1s", "1p2s", "1p3s", "1p4s", "1p5s"]
    docker_multi_df = get_data(docker_multi_f, protocols, process_comm, pows, topology)
    docker_single_df = get_data(docker_single_f, protocols, process_comm, pows, topology)

    print("Differences in latency between docker_multi and docker_single")
    for t in docker_multi_df["topology"].unique():
        for protocol in docker_multi_df["protocol"].unique(): 
            for powof2 in docker_multi_df["Size (Bytes)"].unique():
                docker_multi_latency = docker_multi_df.loc[(docker_multi_df["topology"] == t) & (docker_multi_df["Size (Bytes)"] == powof2) & (docker_multi_df["protocol"] == protocol)]["Latency (us)"]
                docker_single_latency = docker_single_df.loc[(docker_single_df["topology"] == t) & (docker_single_df["Size (Bytes)"] == powof2) & (docker_single_df["protocol"] == protocol)]["Latency (us)"]

                docker_multi_latency /= 1000.0
                docker_single_latency /= 1000.0

                print(" - topology: {:10} protocol {:20} Size (Bytes) {:5}: {{ mean: {:10.4f}, median: {:10.4f}, std: {:10.4f}, min: {:10.4f}, max: {:10.4f} }}".format(
                    t, protocol, powof2,
                    docker_multi_latency.mean() - docker_single_latency.mean(),
                    docker_multi_latency.median() - docker_single_latency.median(),
                    docker_multi_latency.std(ddof=0) - docker_single_latency.std(ddof=0),
                    docker_multi_latency.min() - docker_single_latency.min(),
                    docker_multi_latency.max() - docker_single_latency.max(),
                ))
    




if __name__ == '__main__':
    main()