
hello-func.bpf.o:	file format elf64-bpf

Disassembly of section .text:

0000000000000000 <get_opcode>:
;     return ctx->args[1];
       0:	79 10 08 00 00 00 00 00	r0 = *(u64 *)(r1 + 8)
       1:	95 00 00 00 00 00 00 00	exit

Disassembly of section raw_tp/:

0000000000000000 <hello>:
;     int opcode = get_opcode(ctx);
       0:	85 10 00 00 ff ff ff ff	call -1
;     bpf_printk("Syscall: %d", opcode);
       1:	18 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00	r1 = 0 ll
       3:	b7 02 00 00 0c 00 00 00	r2 = 12
       4:	bf 03 00 00 00 00 00 00	r3 = r0
       5:	85 00 00 00 06 00 00 00	call 6
;     return 0;
       6:	b7 00 00 00 00 00 00 00	r0 = 0
       7:	95 00 00 00 00 00 00 00	exit
