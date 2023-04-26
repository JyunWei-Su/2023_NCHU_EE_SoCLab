/*
 * axi_dma.h
 *
 *  Created on: 2019�~8��24��
 *      Author: jychen
 */
#include "data.h"

#ifndef SRC_AXI_DMA_H_
#define SRC_AXI_DMA_H_


void AXI_DMA_Init(void);
void AXI_DMA_Transfer( UINTPTR BuffAddr, u32 Length , int Direction);
void AXI_DMA_IP_TEST(u32* SD_Receive_Data);

extern volatile int AXI_DMA_TxDone;
extern volatile int AXI_DMA_RxDone;

#endif /* SRC_AXI_DMA_H_ */
