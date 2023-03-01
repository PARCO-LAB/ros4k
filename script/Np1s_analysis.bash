#!/bin/bash

process_comm="inter"

echo "SC TCP with default DDS"
echo "- 2p1s 2^4"
cat sc_tcp_${process_comm}2p1s_*_16/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_tcp_${process_comm}2p1s_*_16/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2p1s 2^16"
cat sc_tcp_${process_comm}2p1s_*_65536/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_tcp_${process_comm}2p1s_*_65536/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2p1s 2^19"
cat sc_tcp_${process_comm}2p1s_*_524288/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_tcp_${process_comm}2p1s_*_524288/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'

echo "- 3p1s 2^4"
cat sc_tcp_${process_comm}3p1s_*_16/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_tcp_${process_comm}3p1s_*_16/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 3p1s 2^16"
cat sc_tcp_${process_comm}3p1s_*_65536/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_tcp_${process_comm}3p1s_*_65536/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 3p1s 2^19"
cat sc_tcp_${process_comm}3p1s_*_524288/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_tcp_${process_comm}3p1s_*_524288/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'

echo "- 4p1s 2^4"
cat sc_tcp_${process_comm}4p1s_*_16/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_tcp_${process_comm}4p1s_*_16/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 4p1s 2^16"
cat sc_tcp_${process_comm}4p1s_*_65536/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_tcp_${process_comm}4p1s_*_65536/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 4p1s 2^19"
cat sc_tcp_${process_comm}4p1s_*_524288/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_tcp_${process_comm}4p1s_*_524288/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'

echo "- 5p1s 2^4"
cat sc_tcp_${process_comm}5p1s_*_16/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_tcp_${process_comm}5p1s_*_16/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 5p1s 2^16"
cat sc_tcp_${process_comm}5p1s_*_65536/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_tcp_${process_comm}5p1s_*_65536/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 5p1s 2^19"
cat sc_tcp_${process_comm}5p1s_*_524288/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_tcp_${process_comm}5p1s_*_524288/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'



echo "SC UDP with default DDS"
echo "- 2p1s 2^4"
cat sc_udp_${process_comm}2p1s_*_16/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_udp_${process_comm}2p1s_*_16/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2p1s 2^16"
cat sc_udp_${process_comm}2p1s_*_65536/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_udp_${process_comm}2p1s_*_65536/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2p1s 2^19"
cat sc_udp_${process_comm}2p1s_*_524288/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_udp_${process_comm}2p1s_*_524288/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'

echo "- 3p1s 2^4"
cat sc_udp_${process_comm}3p1s_*_16/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_udp_${process_comm}3p1s_*_16/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 3p1s 2^16"
cat sc_udp_${process_comm}3p1s_*_65536/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_udp_${process_comm}3p1s_*_65536/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 3p1s 2^19"
cat sc_udp_${process_comm}3p1s_*_524288/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_udp_${process_comm}3p1s_*_524288/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'

echo "- 4p1s 2^4"
cat sc_udp_${process_comm}4p1s_*_16/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_udp_${process_comm}4p1s_*_16/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 4p1s 2^16"
cat sc_udp_${process_comm}4p1s_*_65536/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_udp_${process_comm}4p1s_*_65536/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 4p1s 2^19"
cat sc_udp_${process_comm}4p1s_*_524288/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_udp_${process_comm}4p1s_*_524288/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'

echo "- 5p1s 2^4"
cat sc_udp_${process_comm}5p1s_*_16/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_udp_${process_comm}5p1s_*_16/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 5p1s 2^16"
cat sc_udp_${process_comm}5p1s_*_65536/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_udp_${process_comm}5p1s_*_65536/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 5p1s 2^19"
cat sc_udp_${process_comm}5p1s_*_524288/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_udp_${process_comm}5p1s_*_524288/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'



echo "SHC with default DDS"
echo "- 2p1s 2^4"
cat shc_${process_comm}2p1s_*_16/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat shc_${process_comm}2p1s_*_16/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2p1s 2^16"
cat shc_${process_comm}2p1s_*_65536/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat shc_${process_comm}2p1s_*_65536/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2p1s 2^19"
cat shc_${process_comm}2p1s_*_524288/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat shc_${process_comm}2p1s_*_524288/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'

echo "- 3p1s 2^4"
cat shc_${process_comm}3p1s_*_16/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat shc_${process_comm}3p1s_*_16/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 3p1s 2^16"
cat shc_${process_comm}3p1s_*_65536/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat shc_${process_comm}3p1s_*_65536/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 3p1s 2^19"
cat shc_${process_comm}3p1s_*_524288/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat shc_${process_comm}3p1s_*_524288/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'

echo "- 4p1s 2^4"
cat shc_${process_comm}4p1s_*_16/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat shc_${process_comm}4p1s_*_16/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 4p1s 2^16"
cat shc_${process_comm}4p1s_*_65536/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat shc_${process_comm}4p1s_*_65536/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 4p1s 2^19"
cat shc_${process_comm}4p1s_*_524288/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat shc_${process_comm}4p1s_*_524288/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'

echo "- 5p1s 2^4"
cat shc_${process_comm}5p1s_*_16/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat shc_${process_comm}5p1s_*_16/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 5p1s 2^16"
cat shc_${process_comm}5p1s_*_65536/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat shc_${process_comm}5p1s_*_65536/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 5p1s 2^19"
cat shc_${process_comm}5p1s_*_524288/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat shc_${process_comm}5p1s_*_524288/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'




echo "SC TCP with ICEORYX"
echo "- 2p1s 2^4"
cat sc_tcp_iceoryx_${process_comm}2p1s_*_16/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_tcp_iceoryx_${process_comm}2p1s_*_16/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2p1s 2^16"
cat sc_tcp_iceoryx_${process_comm}2p1s_*_65536/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_tcp_iceoryx_${process_comm}2p1s_*_65536/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2p1s 2^19"
cat sc_tcp_iceoryx_${process_comm}2p1s_*_524288/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_tcp_iceoryx_${process_comm}2p1s_*_524288/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'

echo "- 3p1s 2^4"
cat sc_tcp_iceoryx_${process_comm}3p1s_*_16/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_tcp_iceoryx_${process_comm}3p1s_*_16/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 3p1s 2^16"
cat sc_tcp_iceoryx_${process_comm}3p1s_*_65536/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_tcp_iceoryx_${process_comm}3p1s_*_65536/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 3p1s 2^19"
cat sc_tcp_iceoryx_${process_comm}3p1s_*_524288/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_tcp_iceoryx_${process_comm}3p1s_*_524288/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'

echo "- 4p1s 2^4"
cat sc_tcp_iceoryx_${process_comm}4p1s_*_16/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_tcp_iceoryx_${process_comm}4p1s_*_16/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 4p1s 2^16"
cat sc_tcp_iceoryx_${process_comm}4p1s_*_65536/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_tcp_iceoryx_${process_comm}4p1s_*_65536/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 4p1s 2^19"
cat sc_tcp_iceoryx_${process_comm}4p1s_*_524288/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_tcp_iceoryx_${process_comm}4p1s_*_524288/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'

echo "- 5p1s 2^4"
cat sc_tcp_iceoryx_${process_comm}5p1s_*_16/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_tcp_iceoryx_${process_comm}5p1s_*_16/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 5p1s 2^16"
cat sc_tcp_iceoryx_${process_comm}5p1s_*_65536/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_tcp_iceoryx_${process_comm}5p1s_*_65536/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 5p1s 2^19"
cat sc_tcp_iceoryx_${process_comm}5p1s_*_524288/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_tcp_iceoryx_${process_comm}5p1s_*_524288/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'


echo "SC UDP with ICEORYX"
echo "- 2p1s 2^4"
cat sc_udp_iceoryx_${process_comm}2p1s_*_16/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_udp_iceoryx_${process_comm}2p1s_*_16/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2p1s 2^16"
cat sc_udp_iceoryx_${process_comm}2p1s_*_65536/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_udp_iceoryx_${process_comm}2p1s_*_65536/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2p1s 2^19"
cat sc_udp_iceoryx_${process_comm}2p1s_*_524288/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_udp_iceoryx_${process_comm}2p1s_*_524288/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'

echo "- 3p1s 2^4"
cat sc_udp_iceoryx_${process_comm}3p1s_*_16/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_udp_iceoryx_${process_comm}3p1s_*_16/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 3p1s 2^16"
cat sc_udp_iceoryx_${process_comm}3p1s_*_65536/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_udp_iceoryx_${process_comm}3p1s_*_65536/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 3p1s 2^19"
cat sc_udp_iceoryx_${process_comm}3p1s_*_524288/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_udp_iceoryx_${process_comm}3p1s_*_524288/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'

echo "- 4p1s 2^4"
cat sc_udp_iceoryx_${process_comm}4p1s_*_16/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_udp_iceoryx_${process_comm}4p1s_*_16/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 4p1s 2^16"
cat sc_udp_iceoryx_${process_comm}4p1s_*_65536/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_udp_iceoryx_${process_comm}4p1s_*_65536/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 4p1s 2^19"
cat sc_udp_iceoryx_${process_comm}4p1s_*_524288/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_udp_iceoryx_${process_comm}4p1s_*_524288/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'

echo "- 5p1s 2^4"
cat sc_udp_iceoryx_${process_comm}5p1s_*_16/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_udp_iceoryx_${process_comm}5p1s_*_16/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 5p1s 2^16"
cat sc_udp_iceoryx_${process_comm}5p1s_*_65536/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_udp_iceoryx_${process_comm}5p1s_*_65536/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 5p1s 2^19"
cat sc_udp_iceoryx_${process_comm}5p1s_*_524288/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat sc_udp_iceoryx_${process_comm}5p1s_*_524288/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'


echo "SHC with ICEORYX"
echo "- 2p1s 2^4"
cat shc_iceoryx_${process_comm}2p1s_*_16/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat shc_iceoryx_${process_comm}2p1s_*_16/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2p1s 2^16"
cat shc_iceoryx_${process_comm}2p1s_*_65536/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat shc_iceoryx_${process_comm}2p1s_*_65536/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2p1s 2^19"
cat shc_iceoryx_${process_comm}2p1s_*_524288/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat shc_iceoryx_${process_comm}2p1s_*_524288/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'

echo "- 3p1s 2^4"
cat shc_iceoryx_${process_comm}3p1s_*_16/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat shc_iceoryx_${process_comm}3p1s_*_16/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 3p1s 2^16"
cat shc_iceoryx_${process_comm}3p1s_*_65536/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat shc_iceoryx_${process_comm}3p1s_*_65536/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 3p1s 2^19"
cat shc_iceoryx_${process_comm}3p1s_*_524288/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat shc_iceoryx_${process_comm}3p1s_*_524288/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'

echo "- 4p1s 2^4"
cat shc_iceoryx_${process_comm}4p1s_*_16/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat shc_iceoryx_${process_comm}4p1s_*_16/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 4p1s 2^16"
cat shc_iceoryx_${process_comm}4p1s_*_65536/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat shc_iceoryx_${process_comm}4p1s_*_65536/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 4p1s 2^19"
cat shc_iceoryx_${process_comm}4p1s_*_524288/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat shc_iceoryx_${process_comm}4p1s_*_524288/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'

echo "- 5p1s 2^4"
cat shc_iceoryx_${process_comm}5p1s_*_16/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat shc_iceoryx_${process_comm}5p1s_*_16/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 5p1s 2^16"
cat shc_iceoryx_${process_comm}5p1s_*_65536/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat shc_iceoryx_${process_comm}5p1s_*_65536/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 5p1s 2^19"
cat shc_iceoryx_${process_comm}5p1s_*_524288/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat shc_iceoryx_${process_comm}5p1s_*_524288/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'


if [ $process_comm == "intra" ]
then

echo "ZC with default DDS"
echo "- 2p1s 2^4"
cat zc_${process_comm}2p1s_*_size16/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat zc_${process_comm}2p1s_*_size16/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2p1s 2^16"
cat zc_${process_comm}2p1s_*_size65536/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat zc_${process_comm}2p1s_*_size65536/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2p1s 2^19"
cat zc_${process_comm}2p1s_*_size524288/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat zc_${process_comm}2p1s_*_size524288/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'

echo "- 3p1s 2^4"
cat zc_${process_comm}3p1s_*_size16/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat zc_${process_comm}3p1s_*_size16/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 3p1s 2^16"
cat zc_${process_comm}3p1s_*_size65536/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat zc_${process_comm}3p1s_*_size65536/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 3p1s 2^19"
cat zc_${process_comm}3p1s_*_size524288/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat zc_${process_comm}3p1s_*_size524288/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'

echo "- 4p1s 2^4"
cat zc_${process_comm}4p1s_*_size16/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat zc_${process_comm}4p1s_*_size16/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 4p1s 2^16"
cat zc_${process_comm}4p1s_*_size65536/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat zc_${process_comm}4p1s_*_size65536/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 4p1s 2^19"
cat zc_${process_comm}4p1s_*_size524288/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat zc_${process_comm}4p1s_*_size524288/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'

echo "- 5p1s 2^4"
cat zc_${process_comm}5p1s_*_size16/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat zc_${process_comm}5p1s_*_size16/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 5p1s 2^16"
cat zc_${process_comm}5p1s_*_size65536/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat zc_${process_comm}5p1s_*_size65536/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 5p1s 2^19"
cat zc_${process_comm}5p1s_*_size524288/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat zc_${process_comm}5p1s_*_size524288/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'


echo "ZC with ICEORYX"
echo "- 2p1s 2^4"
cat zc_iceoryx_${process_comm}2p1s_*_size16/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat zc_iceoryx_${process_comm}2p1s_*_size16/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2p1s 2^16"
cat zc_iceoryx_${process_comm}2p1s_*_size65536/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat zc_iceoryx_${process_comm}2p1s_*_size65536/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 2p1s 2^19"
cat zc_iceoryx_${process_comm}2p1s_*_size524288/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat zc_iceoryx_${process_comm}2p1s_*_size524288/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'

echo "- 3p1s 2^4"
cat zc_iceoryx_${process_comm}3p1s_*_size16/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat zc_iceoryx_${process_comm}3p1s_*_size16/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 3p1s 2^16"
cat zc_iceoryx_${process_comm}3p1s_*_size65536/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat zc_iceoryx_${process_comm}3p1s_*_size65536/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 3p1s 2^19"
cat zc_iceoryx_${process_comm}3p1s_*_size524288/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat zc_iceoryx_${process_comm}3p1s_*_size524288/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'

echo "- 4p1s 2^4"
cat zc_iceoryx_${process_comm}4p1s_*_size16/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat zc_iceoryx_${process_comm}4p1s_*_size16/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 4p1s 2^16"
cat zc_iceoryx_${process_comm}4p1s_*_size65536/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat zc_iceoryx_${process_comm}4p1s_*_size65536/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 4p1s 2^19"
cat zc_iceoryx_${process_comm}4p1s_*_size524288/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat zc_iceoryx_${process_comm}4p1s_*_size524288/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'

echo "- 5p1s 2^4"
cat zc_iceoryx_${process_comm}5p1s_*_size16/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat zc_iceoryx_${process_comm}5p1s_*_size16/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 5p1s 2^16"
cat zc_iceoryx_${process_comm}5p1s_*_size65536/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat zc_iceoryx_${process_comm}5p1s_*_size65536/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'
echo "- 5p1s 2^19"
cat zc_iceoryx_${process_comm}5p1s_*_size524288/analysis.csv | grep latency | cut -d, -f4 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) median: %.3f\n", NR, v/NR)}'
cat zc_iceoryx_${process_comm}5p1s_*_size524288/analysis.csv | grep latency | cut -d, -f3 | awk 'BEGIN{v=0.0}{v=v+$0}END{printf("(%i) std:    %.3f\n", NR, v/NR)}'


fi