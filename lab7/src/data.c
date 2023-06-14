


#include "stdio.h"
#include "data.h"

#include "xsdps.h"
#include "ff.h"
#include "string.h"
#define FILE_NAME "lab7.txt"
FATFS fs;

int check_error;


// Main Function
int sd_card_data_rw(){

    u32 transfer_len, receive_len;
    
    // SD Card R/W Behavior
    //-----------------------------------------------------
    print("\r--- SD Card reading ---\n");
    sd_mount();

    for (int i=0; i<PATTERN_SIZE; i++) {
        SD_Transfer_Data [i]=i;
    }

    transfer_len = sizeof (SD_Transfer_Data);
    receive_len  = sizeof (SD_Receive_Data);

    sd_write_data(SD_Transfer_Data, transfer_len);
	sd_read_data (SD_Receive_Data,  receive_len);
    //-----------------------------------------------------
    

    // SD Card R/W Check
    //-----------------------------------------------------
	check_error = 0;
	for (int i=0; i<PATTERN_SIZE; i++ ){
		if (SD_Receive_Data[i] != SD_Transfer_Data[i]){
			check_error = check_error +1;
		}
	}
	if (check_error==0){
		print("SD Card R/W Success!!");
	}else{
		print("SD Card R/W Fail!!");
	}
    //-----------------------------------------------------


    // DMA Transfer Gold pattern
    //-----------------------------------------------------
    int cnt = 0;
    int temp_data[4]={0};
    int gold_array_addr = 0;

    for (int i=0; i< PATTERN_SIZE; i++){

        if (cnt == 0){
            temp_data [0] = SD_Transfer_Data[i];
        }else if (cnt == 1){
            temp_data [1] = SD_Transfer_Data[i];
        }
        else if (cnt == 2){
            temp_data [2] = SD_Transfer_Data[i];
        }
        else if (cnt == 3){
            temp_data [3] = SD_Transfer_Data[i];
        }
        

        if (cnt == 3){
            DMA_Transfer_gold [gold_array_addr] = temp_data[0] + temp_data[2];
            DMA_Transfer_gold [gold_array_addr+1] = temp_data[1] + temp_data[3];
            gold_array_addr = gold_array_addr +2;
        }


        if (cnt == 0){
            cnt = 1;
        }
        else if (cnt == 1){
            cnt = 2;
        }
        else if (cnt == 2){
            cnt = 3;
        }
        else if (cnt == 3){
            cnt = 0;
        }
        
    }
    //-----------------------------------------------------

}

// Initial Setting
void sd_mount(){

	FRESULT status;
	BYTE work[FF_MAX_SS];
	status=f_mount(&fs,"",1);
	if(status != FR_OK){
		printf("%d\n",status);
		printf("It isn't FAT format\n");
		f_mkfs("",FM_FAT32,0,work,sizeof work);
		f_mount(&fs,"",1);
	}
}
// Write Data Function
void sd_write_data(char wr_dat[], u32 wr_len){
	FIL fil;
	UINT bw;
	f_open(&fil,FILE_NAME,FA_CREATE_ALWAYS | FA_WRITE | FA_READ);
	f_lseek(&fil, 0);
	f_write(&fil,wr_dat,wr_len,&bw);
	f_close(&fil);
}
// Read Data Function
void sd_read_data(char rd_dat[], u32 rd_len){
	FIL fil;
	UINT br;
	f_open(&fil,FILE_NAME,FA_READ);
	f_lseek(&fil, 0);
	f_read(&fil,rd_dat,rd_len,&br);
	f_close(&fil);
}



