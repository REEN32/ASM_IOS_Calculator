//
//  fcos.s
//  ARM_ASM_Calculator
//
//  Created by Герман Василевич on 3.12.25.
//

 .section __TEXT,__text,regular,pure_instructions
    .globl  _cos_floats
    .p2align    2

_cos_floats:
    adrp   x8, .const_2pi@PAGE
    add    x8, x8, .const_2pi@PAGEOFF
    ldr    s1, [x8]
    
    fdiv   s2, s0, s1
    frintn s2, s2
    fmul   s2, s2, s1
    fsub   s0, s0, s2

    fmov s8, s0
    
    fmul s1, s8, s8 // x^2
    
    fmul s2, s1, s1 // x^4
    
    fmul s3, s2, s1 // x^6
    
    fmul s4, s3, s1 // x^8
    
    adrp   x8, .const_2@PAGE
    add    x8, x8, .const_2@PAGEOFF
    ldr    s9, [x8]         // s9 = 2.0
    
    adrp   x9, .const_24@PAGE
    add    x9, x9, .const_24@PAGEOFF
    ldr    s10, [x9]        // s10 = 24.0
    
    adrp   x10, .const_720@PAGE
    add    x10, x10, .const_720@PAGEOFF
    ldr    s11, [x10]       // s11 = 720.0
    
    adrp   x11, .const_40320@PAGE
    add    x11, x11, .const_40320@PAGEOFF
    ldr    s12, [x11]       // s11 = 40320.0
    
    adrp   x12, .const_1@PAGE
    add    x12, x12, .const_1@PAGEOFF
    ldr    s14, [x12]  
    
    fmov   s0, s14
    
    fdiv   s13, s1, s9
    fsub   s0, s0, s13

    fdiv   s13, s2, s10
    fadd   s0, s0, s13
    
    fdiv   s13, s3, s11
    fsub   s0, s0, s13
    
    fdiv   s13, s4, s12
    fadd   s0, s0, s13
    ret

    .section __DATA,__data
.const_1:
    .float 1.0
.const_2:
    .float  2.0
.const_24:
    .float  24.0
.const_720:
    .float  720.0
.const_40320:
    .float  40320.0
.const_2pi:
    .float  6.2831853070
