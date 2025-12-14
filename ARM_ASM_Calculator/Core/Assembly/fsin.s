
    .section __TEXT,__text,regular,pure_instructions
    .globl  _sin_floats
    .p2align    2

_sin_floats:
    adrp   x8, .const_2pi@PAGE
    add    x8, x8, .const_2pi@PAGEOFF
    ldr    s1, [x8]
    
    fdiv   s2, s0, s1
    frintn s2, s2
    fmul   s2, s2, s1
    fsub   s0, s0, s2

    fmov s8, s0
    
    fmul s1, s8, s8 // x^3
    fmul s1, s1, s8
    
    fmul s2, s1, s8 // x^5
    fmul s2, s2, s8
    
    fmul s3, s2, s8 // x^7
    fmul s3, s3, s8
    
    adrp   x8, .const_6@PAGE
    add    x8, x8, .const_6@PAGEOFF
    ldr    s9, [x8]         // s9 = 6.0
    
    adrp   x9, .const_120@PAGE
    add    x9, x9, .const_120@PAGEOFF
    ldr    s10, [x9]        // s10 = 120.0
    
    adrp   x10, .const_5040@PAGE
    add    x10, x10, .const_5040@PAGEOFF
    ldr    s11, [x10]       //s11 = 5040.0
    
    fmov   s0, s8
    
    fdiv   s12, s1, s9
    fsub   s0, s0, s12

    fdiv   s12, s2, s10
    fadd   s0, s0, s12
    
    fdiv   s12, s3, s11   
    fsub   s0, s0, s12
    ret

    .section __DATA,__data
.const_6:
    .float  6.0
.const_120:
    .float  120.0
.const_5040:
    .float  5040.0
.const_2pi:
    .float  6.2831853070
