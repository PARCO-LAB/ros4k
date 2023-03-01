#!/bin/bash

process_comm="inter"

echo "SC TCP with default DDS"
echo "- 2^4"
cat sc_tcp_${process_comm}1p1s_*_16/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_tcp_${process_comm}1p1s_*_16/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^5"
cat sc_tcp_${process_comm}1p1s_*_32/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_tcp_${process_comm}1p1s_*_32/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^7"
cat sc_tcp_${process_comm}1p1s_*_128/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_tcp_${process_comm}1p1s_*_128/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^10"
cat sc_tcp_${process_comm}1p1s_*_1024/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_tcp_${process_comm}1p1s_*_1024/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^12"
cat sc_tcp_${process_comm}1p1s_*_4096/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_tcp_${process_comm}1p1s_*_4096/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^14"
cat sc_tcp_${process_comm}1p1s_*_16384/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_tcp_${process_comm}1p1s_*_16384/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^15"
cat sc_tcp_${process_comm}1p1s_*_32768/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_tcp_${process_comm}1p1s_*_32768/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^16"
cat sc_tcp_${process_comm}1p1s_*_65536/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_tcp_${process_comm}1p1s_*_65536/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^17"
cat sc_tcp_${process_comm}1p1s_*_131072/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_tcp_${process_comm}1p1s_*_131072/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^18"
cat sc_tcp_${process_comm}1p1s_*_262144/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_tcp_${process_comm}1p1s_*_262144/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^19"
cat sc_tcp_${process_comm}1p1s_*_524288/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_tcp_${process_comm}1p1s_*_524288/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^20"
cat sc_tcp_${process_comm}1p1s_*_1048576/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_tcp_${process_comm}1p1s_*_1048576/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'

echo "SC UDP with default DDS"
echo "- 2^4"
cat sc_udp_${process_comm}1p1s_*_16/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_udp_${process_comm}1p1s_*_16/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^5"
cat sc_udp_${process_comm}1p1s_*_32/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_udp_${process_comm}1p1s_*_32/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^7"
cat sc_udp_${process_comm}1p1s_*_128/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_udp_${process_comm}1p1s_*_128/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^10"
cat sc_udp_${process_comm}1p1s_*_1024/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_udp_${process_comm}1p1s_*_1024/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^12"
cat sc_udp_${process_comm}1p1s_*_4096/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_udp_${process_comm}1p1s_*_16/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^14"
cat sc_udp_${process_comm}1p1s_*_16384/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_udp_${process_comm}1p1s_*_16384/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^15"
cat sc_udp_${process_comm}1p1s_*_32768/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_udp_${process_comm}1p1s_*_32768/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^16"
cat sc_udp_${process_comm}1p1s_*_65536/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_udp_${process_comm}1p1s_*_65536/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^17"
cat sc_udp_${process_comm}1p1s_*_131072/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_udp_${process_comm}1p1s_*_131072/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^18"
cat sc_udp_${process_comm}1p1s_*_262144/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_udp_${process_comm}1p1s_*_262144/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^19"
cat sc_udp_${process_comm}1p1s_*_524288/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_udp_${process_comm}1p1s_*_524288/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^20"
cat sc_udp_${process_comm}1p1s_*_1048576/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_udp_${process_comm}1p1s_*_1048576/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'

echo "SHC with default DDS"
echo "- 2^4"
cat shc_${process_comm}1p1s_*_16/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat shc_${process_comm}1p1s_*_16/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^5"
cat shc_${process_comm}1p1s_*_32/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat shc_${process_comm}1p1s_*_32/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^7"
cat shc_${process_comm}1p1s_*_128/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat shc_${process_comm}1p1s_*_128/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^10"
cat shc_${process_comm}1p1s_*_1024/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat shc_${process_comm}1p1s_*_1024/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^12"
cat shc_${process_comm}1p1s_*_4096/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat shc_${process_comm}1p1s_*_16/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^14"
cat shc_${process_comm}1p1s_*_16384/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat shc_${process_comm}1p1s_*_16384/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^15"
cat shc_${process_comm}1p1s_*_32768/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat shc_${process_comm}1p1s_*_32768/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^16"
cat shc_${process_comm}1p1s_*_65536/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat shc_${process_comm}1p1s_*_65536/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^17"
cat shc_${process_comm}1p1s_*_131072/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat shc_${process_comm}1p1s_*_131072/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^18"
cat shc_${process_comm}1p1s_*_262144/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat shc_${process_comm}1p1s_*_262144/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^19"
cat shc_${process_comm}1p1s_*_524288/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat shc_${process_comm}1p1s_*_524288/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^20"
cat shc_${process_comm}1p1s_*_1048576/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat shc_${process_comm}1p1s_*_1048576/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'

echo "SC TCP with ICEORYX"
echo "- 2^4"
cat sc_tcp_iceoryx_${process_comm}1p1s_*_16/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_tcp_iceoryx_${process_comm}1p1s_*_16/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^5"
cat sc_tcp_iceoryx_${process_comm}1p1s_*_32/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_tcp_iceoryx_${process_comm}1p1s_*_32/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^7"
cat sc_tcp_iceoryx_${process_comm}1p1s_*_128/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_tcp_iceoryx_${process_comm}1p1s_*_128/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^10"
cat sc_tcp_iceoryx_${process_comm}1p1s_*_1024/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_tcp_iceoryx_${process_comm}1p1s_*_1024/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^12"
cat sc_tcp_iceoryx_${process_comm}1p1s_*_4096/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_tcp_iceoryx_${process_comm}1p1s_*_16/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^14"
cat sc_tcp_iceoryx_${process_comm}1p1s_*_16384/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_tcp_iceoryx_${process_comm}1p1s_*_16384/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^15"
cat sc_tcp_iceoryx_${process_comm}1p1s_*_32768/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_tcp_iceoryx_${process_comm}1p1s_*_32768/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^16"
cat sc_tcp_iceoryx_${process_comm}1p1s_*_65536/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_tcp_iceoryx_${process_comm}1p1s_*_65536/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^17"
cat sc_tcp_iceoryx_${process_comm}1p1s_*_131072/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_tcp_iceoryx_${process_comm}1p1s_*_131072/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^18"
cat sc_tcp_iceoryx_${process_comm}1p1s_*_262144/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_tcp_iceoryx_${process_comm}1p1s_*_262144/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^19"
cat sc_tcp_iceoryx_${process_comm}1p1s_*_524288/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_tcp_iceoryx_${process_comm}1p1s_*_524288/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^20"
cat sc_tcp_iceoryx_${process_comm}1p1s_*_1048576/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_tcp_iceoryx_${process_comm}1p1s_*_1048576/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'

echo "SC UDP with ICEORYX"
echo "- 2^4"
cat sc_udp_iceoryx_${process_comm}1p1s_*_16/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_udp_iceoryx_${process_comm}1p1s_*_16/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^5"
cat sc_udp_iceoryx_${process_comm}1p1s_*_32/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_udp_iceoryx_${process_comm}1p1s_*_32/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^7"
cat sc_udp_iceoryx_${process_comm}1p1s_*_128/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_udp_iceoryx_${process_comm}1p1s_*_128/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^10"
cat sc_udp_iceoryx_${process_comm}1p1s_*_1024/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_udp_iceoryx_${process_comm}1p1s_*_1024/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^12"
cat sc_udp_iceoryx_${process_comm}1p1s_*_4096/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_udp_iceoryx_${process_comm}1p1s_*_16/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^14"
cat sc_udp_iceoryx_${process_comm}1p1s_*_16384/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_udp_iceoryx_${process_comm}1p1s_*_16384/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^15"
cat sc_udp_iceoryx_${process_comm}1p1s_*_32768/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_udp_iceoryx_${process_comm}1p1s_*_32768/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^16"
cat sc_udp_iceoryx_${process_comm}1p1s_*_65536/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_udp_iceoryx_${process_comm}1p1s_*_65536/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^17"
cat sc_udp_iceoryx_${process_comm}1p1s_*_131072/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_udp_iceoryx_${process_comm}1p1s_*_131072/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^18"
cat sc_udp_iceoryx_${process_comm}1p1s_*_262144/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_udp_iceoryx_${process_comm}1p1s_*_262144/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^19"
cat sc_udp_iceoryx_${process_comm}1p1s_*_524288/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_udp_iceoryx_${process_comm}1p1s_*_524288/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^20"
cat sc_udp_iceoryx_${process_comm}1p1s_*_1048576/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_udp_iceoryx_${process_comm}1p1s_*_1048576/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'

echo "SHC with ICEORYX"
echo "- 2^4"
cat shc_iceoryx_${process_comm}1p1s_*_16/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat shc_iceoryx_${process_comm}1p1s_*_16/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^5"
cat shc_iceoryx_${process_comm}1p1s_*_32/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat shc_iceoryx_${process_comm}1p1s_*_32/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^7"
cat shc_iceoryx_${process_comm}1p1s_*_128/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat shc_iceoryx_${process_comm}1p1s_*_128/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^10"
cat shc_iceoryx_${process_comm}1p1s_*_1024/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat shc_iceoryx_${process_comm}1p1s_*_1024/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^12"
cat shc_iceoryx_${process_comm}1p1s_*_4096/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat shc_iceoryx_${process_comm}1p1s_*_16/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^14"
cat shc_iceoryx_${process_comm}1p1s_*_16384/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat shc_iceoryx_${process_comm}1p1s_*_16384/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^15"
cat shc_iceoryx_${process_comm}1p1s_*_32768/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat shc_iceoryx_${process_comm}1p1s_*_32768/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^16"
cat shc_iceoryx_${process_comm}1p1s_*_65536/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat shc_iceoryx_${process_comm}1p1s_*_65536/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^17"
cat shc_iceoryx_${process_comm}1p1s_*_131072/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat shc_iceoryx_${process_comm}1p1s_*_131072/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^18"
cat shc_iceoryx_${process_comm}1p1s_*_262144/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat shc_iceoryx_${process_comm}1p1s_*_262144/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^19"
cat shc_iceoryx_${process_comm}1p1s_*_524288/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat shc_iceoryx_${process_comm}1p1s_*_524288/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^20"
cat shc_iceoryx_${process_comm}1p1s_*_1048576/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat shc_iceoryx_${process_comm}1p1s_*_1048576/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'

if [ $process_comm == "intra" ]
then

echo "ZC with default DDS"
echo "- 2^4"
cat zc_${process_comm}1p1s_*_size16/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat zc_${process_comm}1p1s_*_size16/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^5"
cat zc_${process_comm}1p1s_*_size32/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat zc_${process_comm}1p1s_*_size32/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^7"
cat zc_${process_comm}1p1s_*_size128/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat zc_${process_comm}1p1s_*_size128/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^10"
cat zc_${process_comm}1p1s_*_size1024/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat zc_${process_comm}1p1s_*_size1024/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^12"
cat zc_${process_comm}1p1s_*_size4096/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat zc_${process_comm}1p1s_*_size16/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^14"
cat zc_${process_comm}1p1s_*_size16384/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat zc_${process_comm}1p1s_*_size16384/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^15"
cat zc_${process_comm}1p1s_*_size32768/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat zc_${process_comm}1p1s_*_size32768/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^16"
cat zc_${process_comm}1p1s_*_size65536/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat zc_${process_comm}1p1s_*_size65536/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^17"
cat zc_${process_comm}1p1s_*_size131072/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat zc_${process_comm}1p1s_*_size131072/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^18"
cat zc_${process_comm}1p1s_*_size262144/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat zc_${process_comm}1p1s_*_size262144/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^19"
cat zc_${process_comm}1p1s_*_size524288/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat zc_${process_comm}1p1s_*_size524288/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^20"
cat zc_${process_comm}1p1s_*_size1048576/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat zc_${process_comm}1p1s_*_size1048576/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'


echo "ZC with ICEORYX"
echo "- 2^4"
cat zc_iceoryx_${process_comm}1p1s_*_size16/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat zc_iceoryx_${process_comm}1p1s_*_size16/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^5"
cat zc_iceoryx_${process_comm}1p1s_*_size32/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat zc_iceoryx_${process_comm}1p1s_*_size32/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^7"
cat zc_iceoryx_${process_comm}1p1s_*_size128/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat zc_iceoryx_${process_comm}1p1s_*_size128/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^10"
cat zc_iceoryx_${process_comm}1p1s_*_size1024/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat zc_iceoryx_${process_comm}1p1s_*_size1024/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^12"
cat zc_iceoryx_${process_comm}1p1s_*_size4096/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat zc_iceoryx_${process_comm}1p1s_*_size16/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^14"
cat zc_iceoryx_${process_comm}1p1s_*_size16384/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat zc_iceoryx_${process_comm}1p1s_*_size16384/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^15"
cat zc_iceoryx_${process_comm}1p1s_*_size32768/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat zc_iceoryx_${process_comm}1p1s_*_size32768/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^16"
cat zc_iceoryx_${process_comm}1p1s_*_size65536/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat zc_iceoryx_${process_comm}1p1s_*_size65536/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^17"
cat zc_iceoryx_${process_comm}1p1s_*_size131072/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat zc_iceoryx_${process_comm}1p1s_*_size131072/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^18"
cat zc_iceoryx_${process_comm}1p1s_*_size262144/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat zc_iceoryx_${process_comm}1p1s_*_size262144/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^19"
cat zc_iceoryx_${process_comm}1p1s_*_size524288/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat zc_iceoryx_${process_comm}1p1s_*_size524288/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2^20"
cat zc_iceoryx_${process_comm}1p1s_*_size1048576/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat zc_iceoryx_${process_comm}1p1s_*_size1048576/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'


fi