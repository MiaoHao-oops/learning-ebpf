# load a bpf program (object file) into kernel
# $ bpftool prog load ../hello.bpf.o /sys/fs/bpf/hello

# attach the loaded bpf program named "hello" to eth0
# $ bpftool net attach xdp name hello dev eth0
# When using ip link, we need not to load the bpf program by bpftool
ip link set dev eth0 xdp obj ../hello.bpf.o sec xdp

# list all in-using bpf maps
# $ bpf map list
# 3: ringbuf  name lima_ticker_eve  flags 0x0
#         key 0B  value 0B  max_entries 1048576  memlock 0B
# 41: array  name hello.rodata  flags 0x480
#         key 4B  value 15B  max_entries 1  memlock 4096B
#         btf_id 138  frozen
# 42: array  name hello.bss  flags 0x400
#         key 4B  value 4B  max_entries 1  memlock 4096B

# dump bpf map named "hello.bss", counter is the global variable in hello.bpf.c,
# while 88 is the current value of counter.
# $ bpftool map dump name hello.bss
# [{
#         "value": {
#             ".bss": [{
#                     "counter": 88
#                 }
#             ]
#         }
#     }
# ]

# detach xdp points of eth0
# $ bpftool net detach xdp dev eth0
ip link set dev eth0 xdp off