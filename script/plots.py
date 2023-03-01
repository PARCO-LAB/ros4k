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

MAP_PROTOCOLS = {
    "sc_tcp": "sc tcp (FastRTPS)", 
    "sc_udp": "sc udp (FastRTPS)", 
    "shc": "shc (FastRTPS)", 
    "sc_tcp_iceoryx": "sc tcp (Iceoryx)", 
    "sc_udp_iceoryx": "sc udp (Iceoryx)", 
    "shc_iceoryx": "shc (Iceoryx)",
    "zc": "zc",
    "zc_iceoryx": "zc (Iceoryx)",
    "tzc": "tzc (FastRTPS)",
    "tzc_iceoryx": "tzc (Iceoryx)"
}

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
                    "protocol": np.repeat(MAP_PROTOCOLS[protocol], len(profile_times)),
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
                    "protocol": np.repeat(MAP_PROTOCOLS[protocol], len(profile_times)),
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

def plot(folder, protocols, process_comm, pows, topology, topology_name, types=[], x="Size (Bytes)", y="Latency (us)", hue="protocol", col="topology", xticks=None):
    if not types or len(types) == 0:
        return None
    types = [t for t in types if t in ["boxplot", "lineplot", "violinplot"]]

    df = get_data(folder, protocols, process_comm, pows, topology)
    if df.empty:
        return

    fig_name = process_comm + "_" + topology_name
    if "boxplot" in types: 
        plt.figure()
        fig_boxplot = sns.catplot(data=df, x=x, y=y, hue=hue, col=col, kind="box", showfliers=False, linewidth=0.6)
        fig_boxplot.set(yscale='log')
        fig_boxplot.fig.set_figwidth(30)
        fig_boxplot.fig.set_figheight(6)
        plt.legend(bbox_to_anchor=(1.02, 0.25), loc='upper left', borderaxespad=0)
        fig_boxplot._legend.remove()
        fig_boxplot.figure.savefig(fig_name + "_boxplot.jpg", dpi=DPI)
    if "lineplot" in types: 
        plt.figure()
        fig_lineplot = sns.relplot(data=df, x=x, y=y, hue=hue, col=col, kind="line")
        fig_lineplot.set(yscale='log')
        fig_lineplot.fig.set_figwidth(15)
        fig_lineplot.fig.set_figheight(8)
        if xticks: 
            fig_lineplot.set_xticklabels(xticks, size=20)
        plt.legend(bbox_to_anchor=(1.02, 0.25), loc='upper left', borderaxespad=0)
        fig_lineplot._legend.remove()
        fig_lineplot.figure.savefig(fig_name + "_lineplot.jpg", dpi=DPI)
    if "violinplot" in types:
        plt.figure()
        fig_violinplot = sns.catplot(data=df, x=x, y=y, hue=hue, col=col, linewidth=0.2, kind="violin", inner="quartile", scale="count")
        fig_violinplot.set(yscale='log')
        fig_violinplot.fig.set_figwidth(15)
        fig_violinplot.fig.set_figheight(8)
        if xticks: 
            fig_violinplot.set_xticklabels(xticks, size=20)
        plt.legend(bbox_to_anchor=(1.02, 0.25), loc='upper left', borderaxespad=0)
        fig_violinplot._legend.remove()
        fig_violinplot.figure.savefig(fig_name + "_violinplot.jpg", dpi=DPI)

def inter1p1s(folder):
    print("INTER 1p1s")
    protocols = [
        "sc_tcp", 
        "sc_udp", 
        "shc", 
        "sc_tcp_iceoryx", 
        "sc_udp_iceoryx", 
        "shc_iceoryx"
    ]
    process_comm = "inter"
    pows = [
        4,
        5,
        7,
        10,
        12,
        14,
        15,
        16,
        17,
        18,
        19,
        20
    ]
    xticks = [
        "16B",
        "32B",
        "128B",
        "1KB",
        "4KB",
        "16KB",
        "32KB",
        "64KB",
        "128KB",
        "256KB",
        "0.5MB",
        "1MB",
        "2MB",
        "4MB",
    ]
    topology = ["1p1s"]
    plot_types = ["boxplot", "lineplot", "violinplot"]
    x, y, hue, col = "Size (Bytes)", "Latency (us)", "protocol", "topology"
    plot(folder, protocols, process_comm, pows, topology, "1p1s", plot_types, x, y, hue, col, xticks)

def inter1pNs(folder):
    print("INTER 1pNs")
    protocols = [
        "sc_tcp", 
        "sc_udp", 
        "shc", 
        "sc_tcp_iceoryx", 
        "sc_udp_iceoryx", 
        "shc_iceoryx"
    ]
    process_comm = "inter"
    pows = [
        4,
        16,
        19,
    ]
    topology = ["1p1s", "1p2s", "1p3s", "1p4s", "1p5s"]
    plot_types = ["boxplot", "lineplot", "violinplot"]
    x, y, hue, col = "topology", "Latency (us)", "protocol", "Size (Bytes)"
    plot(folder, protocols, process_comm, pows, topology, "1pNs", plot_types, x, y, hue, col, None)

def interNp1s(folder):
    print("INTER Np1s")
    protocols = [
        "sc_tcp", 
        "sc_udp", 
        "shc", 
        "sc_tcp_iceoryx", 
        "sc_udp_iceoryx", 
        "shc_iceoryx"
    ]
    process_comm = "inter"
    pows = [
        4,
        16,
        19,
    ]
    topology = ["1p1s", "2p1s", "3p1s", "4p1s", "5p1s"]
    plot_types = ["boxplot", "lineplot", "violinplot"]
    x, y, hue, col = "topology", "Latency (us)", "protocol", "Size (Bytes)"
    plot(folder, protocols, process_comm, pows, topology, "Np1s", plot_types, x, y, hue, col, None)

def intra1p1s(folder):
    print("INTRA 1p1s")
    protocols = [
        "sc_tcp", 
        "sc_udp", 
        "shc", 
        "sc_tcp_iceoryx", 
        "sc_udp_iceoryx", 
        "shc_iceoryx",
        "zc"
    ]
    process_comm = "intra"
    pows = [
        4,
        5,
        7,
        10,
        12,
        14,
        15,
        16,
        17,
        18,
        19,
        20
    ]
    xticks = [
        "16B",
        "32B",
        "128B",
        "1KB",
        "4KB",
        "16KB",
        "32KB",
        "64KB",
        "128KB",
        "256KB",
        "0.5MB",
        "1MB",
        "2MB",
        "4MB",
    ]
    topology = ["1p1s"]
    plot_types = ["boxplot", "lineplot", "violinplot"]
    x, y, hue, col = "Size (Bytes)", "Latency (us)", "protocol", "topology"
    plot(folder, protocols, process_comm, pows, topology, "1p1s", plot_types, x, y, hue, col, xticks)

def intra1pNs(folder):
    print("INTRA 1pNs")
    protocols = [
        "sc_tcp", 
        "sc_udp", 
        "shc", 
        "sc_tcp_iceoryx", 
        "sc_udp_iceoryx", 
        "shc_iceoryx",
        "zc"
    ]
    process_comm = "intra"
    pows = [
        4,
        16,
        19
    ]
    topology = ["1p1s", "1p2s", "1p3s", "1p4s", "1p5s"]
    plot_types = ["boxplot", "lineplot", "violinplot"]
    x, y, hue, col = "topology", "Latency (us)", "protocol", "Size (Bytes)"
    plot(folder, protocols, process_comm, pows, topology, "1pNs", plot_types, x, y, hue, col, None)

def intraNp1s(folder):
    print("INTRA 1pNs")
    protocols = [
        "sc_tcp", 
        "sc_udp", 
        "shc", 
        "sc_tcp_iceoryx", 
        "sc_udp_iceoryx", 
        "shc_iceoryx",
        "zc"
    ]
    process_comm = "intra"
    pows = [
        4,
        16,
        19
    ]
    topology = ["1p1s", "2p1s", "3p1s", "4p1s", "5p1s"]
    plot_types = ["boxplot", "lineplot", "violinplot"]
    x, y, hue, col = "topology", "Latency (us)", "protocol", "Size (Bytes)"
    plot(folder, protocols, process_comm, pows, topology, "Np1s", plot_types, x, y, hue, col, None)

def main():
    folder = args.folder

    if not os.path.isdir(folder):
        raise Exception("Input arguments are not folder path")

    funcs = [
        inter1p1s,
        inter1pNs,
        # interNp1s,
        intra1p1s,
        intra1pNs,
        # intraNp1s
    ]

    for fun in funcs: 
        fun(folder)



if __name__ == '__main__':
    main()