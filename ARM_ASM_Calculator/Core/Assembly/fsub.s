
    .section __TEXT,__text,regular,pure_instructions
    .globl  _sub_floats
    .p2align    2

_sub_floats:
    fsub    s0, s0, s1       
    ret
