// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xsobel_stream.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XSobel_stream_CfgInitialize(XSobel_stream *InstancePtr, XSobel_stream_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XSobel_stream_Start(XSobel_stream *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSobel_stream_ReadReg(InstancePtr->Control_BaseAddress, XSOBEL_STREAM_CONTROL_ADDR_AP_CTRL) & 0x80;
    XSobel_stream_WriteReg(InstancePtr->Control_BaseAddress, XSOBEL_STREAM_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XSobel_stream_IsDone(XSobel_stream *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSobel_stream_ReadReg(InstancePtr->Control_BaseAddress, XSOBEL_STREAM_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XSobel_stream_IsIdle(XSobel_stream *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSobel_stream_ReadReg(InstancePtr->Control_BaseAddress, XSOBEL_STREAM_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XSobel_stream_IsReady(XSobel_stream *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSobel_stream_ReadReg(InstancePtr->Control_BaseAddress, XSOBEL_STREAM_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XSobel_stream_EnableAutoRestart(XSobel_stream *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSobel_stream_WriteReg(InstancePtr->Control_BaseAddress, XSOBEL_STREAM_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XSobel_stream_DisableAutoRestart(XSobel_stream *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSobel_stream_WriteReg(InstancePtr->Control_BaseAddress, XSOBEL_STREAM_CONTROL_ADDR_AP_CTRL, 0);
}

void XSobel_stream_Set_height(XSobel_stream *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSobel_stream_WriteReg(InstancePtr->Control_BaseAddress, XSOBEL_STREAM_CONTROL_ADDR_HEIGHT_DATA, Data);
}

u32 XSobel_stream_Get_height(XSobel_stream *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSobel_stream_ReadReg(InstancePtr->Control_BaseAddress, XSOBEL_STREAM_CONTROL_ADDR_HEIGHT_DATA);
    return Data;
}

void XSobel_stream_Set_width(XSobel_stream *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSobel_stream_WriteReg(InstancePtr->Control_BaseAddress, XSOBEL_STREAM_CONTROL_ADDR_WIDTH_DATA, Data);
}

u32 XSobel_stream_Get_width(XSobel_stream *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSobel_stream_ReadReg(InstancePtr->Control_BaseAddress, XSOBEL_STREAM_CONTROL_ADDR_WIDTH_DATA);
    return Data;
}

void XSobel_stream_InterruptGlobalEnable(XSobel_stream *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSobel_stream_WriteReg(InstancePtr->Control_BaseAddress, XSOBEL_STREAM_CONTROL_ADDR_GIE, 1);
}

void XSobel_stream_InterruptGlobalDisable(XSobel_stream *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSobel_stream_WriteReg(InstancePtr->Control_BaseAddress, XSOBEL_STREAM_CONTROL_ADDR_GIE, 0);
}

void XSobel_stream_InterruptEnable(XSobel_stream *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XSobel_stream_ReadReg(InstancePtr->Control_BaseAddress, XSOBEL_STREAM_CONTROL_ADDR_IER);
    XSobel_stream_WriteReg(InstancePtr->Control_BaseAddress, XSOBEL_STREAM_CONTROL_ADDR_IER, Register | Mask);
}

void XSobel_stream_InterruptDisable(XSobel_stream *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XSobel_stream_ReadReg(InstancePtr->Control_BaseAddress, XSOBEL_STREAM_CONTROL_ADDR_IER);
    XSobel_stream_WriteReg(InstancePtr->Control_BaseAddress, XSOBEL_STREAM_CONTROL_ADDR_IER, Register & (~Mask));
}

void XSobel_stream_InterruptClear(XSobel_stream *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSobel_stream_WriteReg(InstancePtr->Control_BaseAddress, XSOBEL_STREAM_CONTROL_ADDR_ISR, Mask);
}

u32 XSobel_stream_InterruptGetEnabled(XSobel_stream *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSobel_stream_ReadReg(InstancePtr->Control_BaseAddress, XSOBEL_STREAM_CONTROL_ADDR_IER);
}

u32 XSobel_stream_InterruptGetStatus(XSobel_stream *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSobel_stream_ReadReg(InstancePtr->Control_BaseAddress, XSOBEL_STREAM_CONTROL_ADDR_ISR);
}

