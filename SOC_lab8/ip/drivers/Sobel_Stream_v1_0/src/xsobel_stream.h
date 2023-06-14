// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XSOBEL_STREAM_H
#define XSOBEL_STREAM_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xsobel_stream_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
#else
typedef struct {
    u16 DeviceId;
    u32 Control_BaseAddress;
} XSobel_stream_Config;
#endif

typedef struct {
    u32 Control_BaseAddress;
    u32 IsReady;
} XSobel_stream;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XSobel_stream_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XSobel_stream_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XSobel_stream_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XSobel_stream_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XSobel_stream_Initialize(XSobel_stream *InstancePtr, u16 DeviceId);
XSobel_stream_Config* XSobel_stream_LookupConfig(u16 DeviceId);
int XSobel_stream_CfgInitialize(XSobel_stream *InstancePtr, XSobel_stream_Config *ConfigPtr);
#else
int XSobel_stream_Initialize(XSobel_stream *InstancePtr, const char* InstanceName);
int XSobel_stream_Release(XSobel_stream *InstancePtr);
#endif

void XSobel_stream_Start(XSobel_stream *InstancePtr);
u32 XSobel_stream_IsDone(XSobel_stream *InstancePtr);
u32 XSobel_stream_IsIdle(XSobel_stream *InstancePtr);
u32 XSobel_stream_IsReady(XSobel_stream *InstancePtr);
void XSobel_stream_EnableAutoRestart(XSobel_stream *InstancePtr);
void XSobel_stream_DisableAutoRestart(XSobel_stream *InstancePtr);

void XSobel_stream_Set_height(XSobel_stream *InstancePtr, u32 Data);
u32 XSobel_stream_Get_height(XSobel_stream *InstancePtr);
void XSobel_stream_Set_width(XSobel_stream *InstancePtr, u32 Data);
u32 XSobel_stream_Get_width(XSobel_stream *InstancePtr);

void XSobel_stream_InterruptGlobalEnable(XSobel_stream *InstancePtr);
void XSobel_stream_InterruptGlobalDisable(XSobel_stream *InstancePtr);
void XSobel_stream_InterruptEnable(XSobel_stream *InstancePtr, u32 Mask);
void XSobel_stream_InterruptDisable(XSobel_stream *InstancePtr, u32 Mask);
void XSobel_stream_InterruptClear(XSobel_stream *InstancePtr, u32 Mask);
u32 XSobel_stream_InterruptGetEnabled(XSobel_stream *InstancePtr);
u32 XSobel_stream_InterruptGetStatus(XSobel_stream *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
