    .section __TEXT,__text,regular,pure_instructions
    .globl  _add_floats
    .p2align    2

_add_floats:
    fadd    s0, s0, s1  
    ret
