//
//  ftg.s
//  ARM_ASM_Calculator
//
//  Created by Герман Василевич on 3.12.25.
//


    .section __TEXT,__text,regular,pure_instructions
    .globl  _tg_floats
    .p2align    2

_tg_floats:
    adrp   x8, .const_2pi@PAGE
    add    x8, x8, .const_2pi@PAGEOFF
    ldr    s1, [x8]
    
    fdiv   s2, s0, s1
    frintn s2, s2
    fmul   s2, s2, s1
    fsub   s8, s0, s2

    fmov s8, s0
    
    fmul s1, s8, s8 // x^3
    fmul s1, s1, s8
    
    fmul s2, s1, s8 // x^5
    fmul s2, s2, s8
    
    fmul s3, s2, s8 // x^7
    fmul s3, s3, s8
    
    adrp   x8, .const_3@PAGE
    add    x8, x8, .const_3@PAGEOFF
    ldr    s9, [x8]         // s9 = 3.0
    
    adrp   x9, .const_2@PAGE
    add    x9, x9, .const_2@PAGEOFF
    ldr    s10, [x9]
    
    adrp   x10, .const_15@PAGE
    add    x10, x10, .const_15@PAGEOFF
    ldr    s11, [x10]
    
    adrp   x10, .const_17@PAGE
    add    x10, x10, .const_17@PAGEOFF
    ldr    s13, [x10]
    
    adrp   x10, .const_315@PAGE
    add    x10, x10, .const_315@PAGEOFF
    ldr    s14, [x10]
    
    fmov   s0, s8
    
    fdiv   s12, s1, s9
    fadd   s0, s0, s12

    fmul   s12, s2, s10
    fdiv   s12, s12, s11
    fadd   s0, s0, s12
    
    fmul   s12, s3, s13
    fdiv   s12, s12, s14
    fadd   s0, s0, s12
    ret

    .section __DATA,__data
.const_3:
    .float 3.0
.const_2:
    .float 2.0
.const_15:
    .float 15.0
.const_17:
    .float 17.0
.const_315:
    .float 315.0
.const_2pi:
    .float  6.2831853070
