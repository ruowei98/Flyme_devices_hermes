.class public abstract Lcom/android/internal/telephony/uicc/IccFileHandler;
.super Landroid/os/Handler;
.source "IccFileHandler.java"

# interfaces
.implements Lcom/android/internal/telephony/uicc/IccConstants;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;
    }
.end annotation


# static fields
.field protected static final COMMAND_GET_RESPONSE:I = 0xc0

.field protected static final COMMAND_READ_BINARY:I = 0xb0

.field protected static final COMMAND_READ_RECORD:I = 0xb2

.field protected static final COMMAND_SEEK:I = 0xa2

.field protected static final COMMAND_UPDATE_BINARY:I = 0xd6

.field protected static final COMMAND_UPDATE_RECORD:I = 0xdc

.field protected static final EF_TYPE_CYCLIC:I = 0x3

.field protected static final EF_TYPE_LINEAR_FIXED:I = 0x1

.field protected static final EF_TYPE_TRANSPARENT:I = 0x0

.field protected static final EVENT_GET_BINARY_SIZE_DONE:I = 0x4

.field protected static final EVENT_GET_EF_LINEAR_RECORD_SIZE_DONE:I = 0x8

.field protected static final EVENT_GET_RECORD_SIZE_DONE:I = 0x6

.field protected static final EVENT_GET_RECORD_SIZE_IMG_DONE:I = 0xb

.field protected static final EVENT_READ_BINARY_DONE:I = 0x5

.field protected static final EVENT_READ_ICON_DONE:I = 0xa

.field protected static final EVENT_READ_IMG_DONE:I = 0x9

.field protected static final EVENT_READ_RECORD_DONE:I = 0x7

.field protected static final EVENT_SELECT_EF_FILE:I = 0x64

.field protected static final GET_RESPONSE_EF_IMG_SIZE_BYTES:I = 0xa

.field protected static final GET_RESPONSE_EF_SIZE_BYTES:I = 0xf

.field protected static final READ_RECORD_MODE_ABSOLUTE:I = 0x4

.field protected static final RESPONSE_DATA_ACCESS_CONDITION_1:I = 0x8

.field protected static final RESPONSE_DATA_ACCESS_CONDITION_2:I = 0x9

.field protected static final RESPONSE_DATA_ACCESS_CONDITION_3:I = 0xa

.field protected static final RESPONSE_DATA_FILE_ID_1:I = 0x4

.field protected static final RESPONSE_DATA_FILE_ID_2:I = 0x5

.field protected static final RESPONSE_DATA_FILE_SIZE_1:I = 0x2

.field protected static final RESPONSE_DATA_FILE_SIZE_2:I = 0x3

.field protected static final RESPONSE_DATA_FILE_STATUS:I = 0xb

.field protected static final RESPONSE_DATA_FILE_TYPE:I = 0x6

.field protected static final RESPONSE_DATA_LENGTH:I = 0xc

.field protected static final RESPONSE_DATA_RECORD_LENGTH:I = 0xe

.field protected static final RESPONSE_DATA_RFU_1:I = 0x0

.field protected static final RESPONSE_DATA_RFU_2:I = 0x1

.field protected static final RESPONSE_DATA_RFU_3:I = 0x7

.field protected static final RESPONSE_DATA_STRUCTURE:I = 0xd

.field protected static final TYPE_DF:I = 0x2

.field protected static final TYPE_EF:I = 0x4

.field protected static final TYPE_MF:I = 0x1

.field protected static final TYPE_RFU:I


# instance fields
.field protected final mAid:Ljava/lang/String;

.field protected final mCi:Lcom/android/internal/telephony/CommandsInterface;

.field protected final mParentApp:Lcom/android/internal/telephony/uicc/UiccCardApplication;


# direct methods
.method protected constructor <init>(Lcom/android/internal/telephony/uicc/UiccCardApplication;Ljava/lang/String;Lcom/android/internal/telephony/CommandsInterface;)V
    .locals 0
    .param p1, "app"    # Lcom/android/internal/telephony/uicc/UiccCardApplication;
    .param p2, "aid"    # Ljava/lang/String;
    .param p3, "ci"    # Lcom/android/internal/telephony/CommandsInterface;

    .prologue
    .line 222
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 223
    iput-object p1, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mParentApp:Lcom/android/internal/telephony/uicc/UiccCardApplication;

    .line 224
    iput-object p2, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mAid:Ljava/lang/String;

    .line 225
    iput-object p3, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    .line 226
    return-void
.end method

.method private processException(Landroid/os/Message;Landroid/os/AsyncResult;)Z
    .locals 5
    .param p1, "response"    # Landroid/os/Message;
    .param p2, "ar"    # Landroid/os/AsyncResult;

    .prologue
    const/4 v4, 0x0

    .line 510
    const/4 v0, 0x0

    .line 511
    .local v0, "flag":Z
    iget-object v2, p2, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v2, Lcom/android/internal/telephony/uicc/IccIoResult;

    .line 512
    .local v2, "result":Lcom/android/internal/telephony/uicc/IccIoResult;
    iget-object v3, p2, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v3, :cond_1

    .line 513
    iget-object v3, p2, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-direct {p0, p1, v4, v3}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 514
    const/4 v0, 0x1

    .line 522
    :cond_0
    :goto_0
    return v0

    .line 516
    :cond_1
    invoke-virtual {v2}, Lcom/android/internal/telephony/uicc/IccIoResult;->getException()Lcom/android/internal/telephony/uicc/IccException;

    move-result-object v1

    .line 517
    .local v1, "iccException":Lcom/android/internal/telephony/uicc/IccException;
    if-eqz v1, :cond_0

    .line 518
    invoke-direct {p0, p1, v4, v1}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 519
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "response"    # Landroid/os/Message;
    .param p2, "result"    # Ljava/lang/Object;
    .param p3, "ex"    # Ljava/lang/Throwable;

    .prologue
    .line 499
    if-nez p1, :cond_0

    .line 506
    :goto_0
    return-void

    .line 503
    :cond_0
    invoke-static {p1, p2, p3}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 505
    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    goto :goto_0
.end method


# virtual methods
.method public dispose()V
    .locals 0

    .prologue
    .line 229
    return-void
.end method

.method protected getCommonIccEFPath(I)Ljava/lang/String;
    .locals 1
    .param p1, "efid"    # I

    .prologue
    .line 805
    sparse-switch p1, :sswitch_data_0

    .line 825
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 814
    :sswitch_0
    const-string v0, "3F007F10"

    goto :goto_0

    .line 818
    :sswitch_1
    const-string v0, "3F00"

    goto :goto_0

    .line 821
    :sswitch_2
    const-string v0, "3F007F105F3A"

    goto :goto_0

    .line 823
    :sswitch_3
    const-string v0, "3F007F105F50"

    goto :goto_0

    .line 805
    nop

    :sswitch_data_0
    .sparse-switch
        0x2f05 -> :sswitch_1
        0x2fe2 -> :sswitch_1
        0x4f20 -> :sswitch_3
        0x4f30 -> :sswitch_2
        0x6f3a -> :sswitch_0
        0x6f3b -> :sswitch_0
        0x6f40 -> :sswitch_0
        0x6f49 -> :sswitch_0
        0x6f4a -> :sswitch_0
        0x6f4b -> :sswitch_0
        0x6f4c -> :sswitch_0
        0x6fe5 -> :sswitch_0
    .end sparse-switch
.end method

.method public getEFLinearRecordSize(ILandroid/os/Message;)V
    .locals 1
    .param p1, "fileid"    # I
    .param p2, "onLoaded"    # Landroid/os/Message;

    .prologue
    .line 315
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/uicc/IccFileHandler;->getEFPath(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0, p2}, Lcom/android/internal/telephony/uicc/IccFileHandler;->getEFLinearRecordSize(ILjava/lang/String;Landroid/os/Message;)V

    .line 316
    return-void
.end method

.method public getEFLinearRecordSize(ILjava/lang/String;Landroid/os/Message;)V
    .locals 11
    .param p1, "fileid"    # I
    .param p2, "path"    # Ljava/lang/String;
    .param p3, "onLoaded"    # Landroid/os/Message;

    .prologue
    const/4 v7, 0x0

    const/4 v4, 0x0

    .line 298
    const/16 v0, 0x8

    new-instance v1, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;

    invoke-direct {v1, p1, p2, p3}, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;-><init>(ILjava/lang/String;Landroid/os/Message;)V

    invoke-virtual {p0, v0, v1}, Lcom/android/internal/telephony/uicc/IccFileHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v10

    .line 301
    .local v10, "response":Landroid/os/Message;
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v1, 0xc0

    const/16 v6, 0xf

    iget-object v9, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mAid:Ljava/lang/String;

    move v2, p1

    move-object v3, p2

    move v5, v4

    move-object v8, v7

    invoke-interface/range {v0 .. v10}, Lcom/android/internal/telephony/CommandsInterface;->iccIOForApp(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    .line 303
    return-void
.end method

.method protected abstract getEFPath(I)Ljava/lang/String;
.end method

.method protected getEFPath(IZ)Ljava/lang/String;
    .locals 1
    .param p1, "efid"    # I
    .param p2, "is7FFF"    # Z

    .prologue
    .line 946
    const/4 v0, 0x0

    return-object v0
.end method

.method protected getSmsEFPath(I)Ljava/lang/String;
    .locals 2
    .param p1, "mode"    # I

    .prologue
    .line 857
    const-string v0, ""

    .line 859
    .local v0, "efpath":Ljava/lang/String;
    const/4 v1, 0x1

    if-ne p1, v1, :cond_1

    .line 860
    const-string v0, "3F007F10"

    .line 864
    :cond_0
    :goto_0
    return-object v0

    .line 861
    :cond_1
    const/4 v1, 0x2

    if-ne p1, v1, :cond_0

    .line 862
    const-string v0, "3F007F25"

    goto :goto_0
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 36
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 531
    const/16 v33, 0x0

    .line 539
    .local v33, "response":Landroid/os/Message;
    const/16 v31, 0x0

    .line 540
    .local v31, "path":Ljava/lang/String;
    const/16 v27, 0x0

    .line 543
    .local v27, "channel":I
    :try_start_0
    move-object/from16 v0, p1

    iget v3, v0, Landroid/os/Message;->what:I

    packed-switch v3, :pswitch_data_0

    :goto_0
    move/from16 v13, v27

    .line 792
    .end local v27    # "channel":I
    .local v13, "channel":I
    :goto_1
    return-void

    .line 545
    .end local v13    # "channel":I
    .restart local v27    # "channel":I
    :pswitch_0
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v26, v0

    check-cast v26, Landroid/os/AsyncResult;

    .line 546
    .local v26, "ar":Landroid/os/AsyncResult;
    move-object/from16 v0, v26

    iget-object v0, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    move-object/from16 v30, v0

    check-cast v30, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;

    .line 547
    .local v30, "lc":Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;
    move-object/from16 v0, v26

    iget-object v0, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    move-object/from16 v34, v0

    check-cast v34, Lcom/android/internal/telephony/uicc/IccIoResult;

    .line 548
    .local v34, "result":Lcom/android/internal/telephony/uicc/IccIoResult;
    move-object/from16 v0, v30

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mOnLoaded:Landroid/os/Message;

    move-object/from16 v33, v0

    .line 550
    move-object/from16 v0, p1

    iget-object v3, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Landroid/os/AsyncResult;

    move-object/from16 v0, p0

    move-object/from16 v1, v33

    invoke-direct {v0, v1, v3}, Lcom/android/internal/telephony/uicc/IccFileHandler;->processException(Landroid/os/Message;Landroid/os/AsyncResult;)Z

    move-result v3

    if-eqz v3, :cond_0

    move/from16 v13, v27

    .line 551
    .end local v27    # "channel":I
    .restart local v13    # "channel":I
    goto :goto_1

    .line 554
    .end local v13    # "channel":I
    .restart local v27    # "channel":I
    :cond_0
    move-object/from16 v0, v34

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/IccIoResult;->payload:[B

    move-object/from16 v28, v0

    .line 556
    .local v28, "data":[B
    invoke-static/range {v28 .. v28}, Lcom/android/internal/telephony/uicc/UiccTlvData;->isUiccTlvData([B)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 558
    invoke-static/range {v28 .. v28}, Lcom/android/internal/telephony/uicc/UiccTlvData;->parse([B)Lcom/android/internal/telephony/uicc/UiccTlvData;

    move-result-object v35

    .line 560
    .local v35, "tlvData":Lcom/android/internal/telephony/uicc/UiccTlvData;
    invoke-virtual/range {v35 .. v35}, Lcom/android/internal/telephony/uicc/UiccTlvData;->isIncomplete()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 561
    new-instance v3, Lcom/android/internal/telephony/uicc/IccFileTypeMismatch;

    invoke-direct {v3}, Lcom/android/internal/telephony/uicc/IccFileTypeMismatch;-><init>()V

    throw v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 785
    .end local v26    # "ar":Landroid/os/AsyncResult;
    .end local v28    # "data":[B
    .end local v30    # "lc":Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;
    .end local v34    # "result":Lcom/android/internal/telephony/uicc/IccIoResult;
    .end local v35    # "tlvData":Lcom/android/internal/telephony/uicc/UiccTlvData;
    :catch_0
    move-exception v29

    move/from16 v13, v27

    .line 786
    .end local v27    # "channel":I
    .restart local v13    # "channel":I
    .local v29, "exc":Ljava/lang/Exception;
    :goto_2
    if-eqz v33, :cond_1d

    .line 787
    const/4 v3, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v33

    move-object/from16 v2, v29

    invoke-direct {v0, v1, v3, v2}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 564
    .end local v13    # "channel":I
    .end local v29    # "exc":Ljava/lang/Exception;
    .restart local v26    # "ar":Landroid/os/AsyncResult;
    .restart local v27    # "channel":I
    .restart local v28    # "data":[B
    .restart local v30    # "lc":Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;
    .restart local v34    # "result":Lcom/android/internal/telephony/uicc/IccIoResult;
    .restart local v35    # "tlvData":Lcom/android/internal/telephony/uicc/UiccTlvData;
    :cond_1
    const/4 v3, 0x3

    :try_start_1
    new-array v0, v3, [I

    move-object/from16 v32, v0

    .line 565
    .local v32, "recordSize":[I
    const/4 v3, 0x0

    move-object/from16 v0, v35

    iget v4, v0, Lcom/android/internal/telephony/uicc/UiccTlvData;->mRecordSize:I

    aput v4, v32, v3

    .line 566
    const/4 v3, 0x1

    move-object/from16 v0, v35

    iget v4, v0, Lcom/android/internal/telephony/uicc/UiccTlvData;->mFileSize:I

    aput v4, v32, v3

    .line 567
    const/4 v3, 0x2

    move-object/from16 v0, v35

    iget v4, v0, Lcom/android/internal/telephony/uicc/UiccTlvData;->mNumRecords:I

    aput v4, v32, v3

    .line 582
    .end local v35    # "tlvData":Lcom/android/internal/telephony/uicc/UiccTlvData;
    :goto_3
    const/4 v3, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v33

    move-object/from16 v2, v32

    invoke-direct {v0, v1, v2, v3}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V

    move/from16 v13, v27

    .line 583
    .end local v27    # "channel":I
    .restart local v13    # "channel":I
    goto/16 :goto_1

    .line 569
    .end local v13    # "channel":I
    .end local v32    # "recordSize":[I
    .restart local v27    # "channel":I
    :cond_2
    const/4 v3, 0x4

    const/4 v4, 0x6

    aget-byte v4, v28, v4

    if-ne v3, v4, :cond_3

    const/4 v3, 0x1

    const/16 v4, 0xd

    aget-byte v4, v28, v4

    if-ne v3, v4, :cond_3

    .line 572
    const/4 v3, 0x3

    new-array v0, v3, [I

    move-object/from16 v32, v0

    .line 573
    .restart local v32    # "recordSize":[I
    const/4 v3, 0x0

    const/16 v4, 0xe

    aget-byte v4, v28, v4

    and-int/lit16 v4, v4, 0xff

    aput v4, v32, v3

    .line 574
    const/4 v3, 0x1

    const/4 v4, 0x2

    aget-byte v4, v28, v4

    and-int/lit16 v4, v4, 0xff

    shl-int/lit8 v4, v4, 0x8

    const/4 v6, 0x3

    aget-byte v6, v28, v6

    and-int/lit16 v6, v6, 0xff

    add-int/2addr v4, v6

    aput v4, v32, v3

    .line 576
    const/4 v3, 0x2

    const/4 v4, 0x1

    aget v4, v32, v4

    const/4 v6, 0x0

    aget v6, v32, v6

    div-int/2addr v4, v6

    aput v4, v32, v3

    goto :goto_3

    .line 579
    .end local v32    # "recordSize":[I
    :cond_3
    new-instance v3, Lcom/android/internal/telephony/uicc/IccFileTypeMismatch;

    invoke-direct {v3}, Lcom/android/internal/telephony/uicc/IccFileTypeMismatch;-><init>()V

    throw v3

    .line 587
    .end local v26    # "ar":Landroid/os/AsyncResult;
    .end local v28    # "data":[B
    .end local v30    # "lc":Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;
    .end local v34    # "result":Lcom/android/internal/telephony/uicc/IccIoResult;
    :pswitch_1
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v26, v0

    check-cast v26, Landroid/os/AsyncResult;

    .line 588
    .restart local v26    # "ar":Landroid/os/AsyncResult;
    move-object/from16 v0, v26

    iget-object v0, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    move-object/from16 v30, v0

    check-cast v30, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;

    .line 589
    .restart local v30    # "lc":Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;
    move-object/from16 v0, v26

    iget-object v0, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    move-object/from16 v34, v0

    check-cast v34, Lcom/android/internal/telephony/uicc/IccIoResult;

    .line 590
    .restart local v34    # "result":Lcom/android/internal/telephony/uicc/IccIoResult;
    move-object/from16 v0, v30

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mOnLoaded:Landroid/os/Message;

    move-object/from16 v33, v0

    .line 592
    move-object/from16 v0, p1

    iget-object v3, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Landroid/os/AsyncResult;

    move-object/from16 v0, p0

    move-object/from16 v1, v33

    invoke-direct {v0, v1, v3}, Lcom/android/internal/telephony/uicc/IccFileHandler;->processException(Landroid/os/Message;Landroid/os/AsyncResult;)Z

    move-result v3

    if-eqz v3, :cond_4

    move/from16 v13, v27

    .line 593
    .end local v27    # "channel":I
    .restart local v13    # "channel":I
    goto/16 :goto_1

    .line 596
    .end local v13    # "channel":I
    .restart local v27    # "channel":I
    :cond_4
    move-object/from16 v0, v34

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/IccIoResult;->payload:[B

    move-object/from16 v28, v0

    .line 597
    .restart local v28    # "data":[B
    move-object/from16 v0, v30

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mPath:Ljava/lang/String;

    move-object/from16 v31, v0

    .line 599
    invoke-static/range {v28 .. v28}, Lcom/android/internal/telephony/uicc/UiccTlvData;->isUiccTlvData([B)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 601
    invoke-static/range {v28 .. v28}, Lcom/android/internal/telephony/uicc/UiccTlvData;->parse([B)Lcom/android/internal/telephony/uicc/UiccTlvData;

    move-result-object v35

    .line 603
    .restart local v35    # "tlvData":Lcom/android/internal/telephony/uicc/UiccTlvData;
    invoke-virtual/range {v35 .. v35}, Lcom/android/internal/telephony/uicc/UiccTlvData;->isIncomplete()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 604
    new-instance v3, Lcom/android/internal/telephony/uicc/IccFileTypeMismatch;

    invoke-direct {v3}, Lcom/android/internal/telephony/uicc/IccFileTypeMismatch;-><init>()V

    throw v3

    .line 607
    :cond_5
    move-object/from16 v0, v35

    iget v3, v0, Lcom/android/internal/telephony/uicc/UiccTlvData;->mRecordSize:I

    move-object/from16 v0, v30

    iput v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mRecordSize:I

    .line 608
    move-object/from16 v0, v35

    iget v3, v0, Lcom/android/internal/telephony/uicc/UiccTlvData;->mNumRecords:I

    move-object/from16 v0, v30

    iput v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mCountRecords:I

    .line 609
    move-object/from16 v0, v35

    iget v9, v0, Lcom/android/internal/telephony/uicc/UiccTlvData;->mFileSize:I

    .line 627
    .end local v35    # "tlvData":Lcom/android/internal/telephony/uicc/UiccTlvData;
    .local v9, "size":I
    :goto_4
    move-object/from16 v0, v30

    iget-boolean v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mLoadAll:Z

    if-eqz v3, :cond_b

    .line 628
    new-instance v3, Ljava/util/ArrayList;

    move-object/from16 v0, v30

    iget v4, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mCountRecords:I

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    move-object/from16 v0, v30

    iput-object v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->results:Ljava/util/ArrayList;

    .line 633
    :cond_6
    :goto_5
    if-nez v31, :cond_7

    .line 634
    move-object/from16 v0, v30

    iget v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mEfid:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/android/internal/telephony/uicc/IccFileHandler;->getEFPath(I)Ljava/lang/String;

    move-result-object v31

    .line 638
    :cond_7
    move-object/from16 v0, v30

    iget v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mMode:I

    const/4 v4, -0x1

    if-eq v3, v4, :cond_c

    .line 639
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v4, 0xb2

    move-object/from16 v0, v30

    iget v5, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mEfid:I

    move-object/from16 v0, v30

    iget v6, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mMode:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lcom/android/internal/telephony/uicc/IccFileHandler;->getSmsEFPath(I)Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, v30

    iget v7, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mRecordNum:I

    const/4 v8, 0x4

    move-object/from16 v0, v30

    iget v9, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mRecordSize:I

    .end local v9    # "size":I
    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mAid:Ljava/lang/String;

    move-object/from16 v0, v30

    iget v13, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mChannel:I

    const/4 v14, 0x7

    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-virtual {v0, v14, v1}, Lcom/android/internal/telephony/uicc/IccFileHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v14

    invoke-interface/range {v3 .. v14}, Lcom/android/internal/telephony/CommandsInterface;->iccIOForAppEx(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ILandroid/os/Message;)V

    move/from16 v13, v27

    .end local v27    # "channel":I
    .restart local v13    # "channel":I
    goto/16 :goto_1

    .line 611
    .end local v13    # "channel":I
    .restart local v27    # "channel":I
    :cond_8
    const/4 v3, 0x4

    const/4 v4, 0x6

    aget-byte v4, v28, v4

    if-ne v3, v4, :cond_a

    .line 613
    const/4 v3, 0x1

    const/16 v4, 0xd

    aget-byte v4, v28, v4

    if-eq v3, v4, :cond_9

    .line 614
    new-instance v3, Lcom/android/internal/telephony/uicc/IccFileTypeMismatch;

    invoke-direct {v3}, Lcom/android/internal/telephony/uicc/IccFileTypeMismatch;-><init>()V

    throw v3

    .line 617
    :cond_9
    const/16 v3, 0xe

    aget-byte v3, v28, v3

    and-int/lit16 v3, v3, 0xff

    move-object/from16 v0, v30

    iput v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mRecordSize:I

    .line 619
    const/4 v3, 0x2

    aget-byte v3, v28, v3

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v3, v3, 0x8

    const/4 v4, 0x3

    aget-byte v4, v28, v4

    and-int/lit16 v4, v4, 0xff

    add-int v9, v3, v4

    .line 622
    .restart local v9    # "size":I
    move-object/from16 v0, v30

    iget v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mRecordSize:I

    div-int v3, v9, v3

    move-object/from16 v0, v30

    iput v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mCountRecords:I

    goto/16 :goto_4

    .line 624
    .end local v9    # "size":I
    :cond_a
    new-instance v3, Lcom/android/internal/telephony/uicc/IccFileTypeMismatch;

    invoke-direct {v3}, Lcom/android/internal/telephony/uicc/IccFileTypeMismatch;-><init>()V

    throw v3

    .line 629
    .restart local v9    # "size":I
    :cond_b
    move-object/from16 v0, v30

    iget-boolean v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mLoadPart:Z

    if-eqz v3, :cond_6

    .line 630
    move-object/from16 v0, v30

    iget v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mCountRecords:I

    move-object/from16 v0, v30

    # invokes: Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->initLCResults(I)V
    invoke-static {v0, v3}, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->access$000(Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;I)V

    goto/16 :goto_5

    .line 645
    :cond_c
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v4, 0xb2

    move-object/from16 v0, v30

    iget v5, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mEfid:I

    move-object/from16 v0, v30

    iget v7, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mRecordNum:I

    const/4 v8, 0x4

    move-object/from16 v0, v30

    iget v9, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mRecordSize:I

    .end local v9    # "size":I
    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mAid:Ljava/lang/String;

    move-object/from16 v0, v30

    iget v13, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mChannel:I

    const/4 v6, 0x7

    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-virtual {v0, v6, v1}, Lcom/android/internal/telephony/uicc/IccFileHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v14

    move-object/from16 v6, v31

    invoke-interface/range {v3 .. v14}, Lcom/android/internal/telephony/CommandsInterface;->iccIOForAppEx(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ILandroid/os/Message;)V

    move/from16 v13, v27

    .line 651
    .end local v27    # "channel":I
    .restart local v13    # "channel":I
    goto/16 :goto_1

    .line 653
    .end local v13    # "channel":I
    .end local v26    # "ar":Landroid/os/AsyncResult;
    .end local v28    # "data":[B
    .end local v30    # "lc":Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;
    .end local v34    # "result":Lcom/android/internal/telephony/uicc/IccIoResult;
    .restart local v27    # "channel":I
    :pswitch_2
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v26, v0

    check-cast v26, Landroid/os/AsyncResult;

    .line 654
    .restart local v26    # "ar":Landroid/os/AsyncResult;
    move-object/from16 v0, v26

    iget-object v3, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    move-object v0, v3

    check-cast v0, Landroid/os/Message;

    move-object/from16 v33, v0

    .line 655
    move-object/from16 v0, v26

    iget-object v0, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    move-object/from16 v34, v0

    check-cast v34, Lcom/android/internal/telephony/uicc/IccIoResult;

    .line 657
    .restart local v34    # "result":Lcom/android/internal/telephony/uicc/IccIoResult;
    move-object/from16 v0, p1

    iget-object v3, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Landroid/os/AsyncResult;

    move-object/from16 v0, p0

    move-object/from16 v1, v33

    invoke-direct {v0, v1, v3}, Lcom/android/internal/telephony/uicc/IccFileHandler;->processException(Landroid/os/Message;Landroid/os/AsyncResult;)Z

    move-result v3

    if-eqz v3, :cond_d

    move/from16 v13, v27

    .line 658
    .end local v27    # "channel":I
    .restart local v13    # "channel":I
    goto/16 :goto_1

    .line 661
    .end local v13    # "channel":I
    .restart local v27    # "channel":I
    :cond_d
    move-object/from16 v0, v34

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/IccIoResult;->payload:[B

    move-object/from16 v28, v0

    .line 663
    .restart local v28    # "data":[B
    move-object/from16 v0, p1

    iget v5, v0, Landroid/os/Message;->arg1:I

    .line 664
    .local v5, "fileid":I
    move-object/from16 v0, p1

    iget v13, v0, Landroid/os/Message;->arg2:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 666
    .end local v27    # "channel":I
    .restart local v13    # "channel":I
    :try_start_2
    invoke-static/range {v28 .. v28}, Lcom/android/internal/telephony/uicc/UiccTlvData;->isUiccTlvData([B)Z

    move-result v3

    if-eqz v3, :cond_f

    .line 669
    invoke-static/range {v28 .. v28}, Lcom/android/internal/telephony/uicc/UiccTlvData;->parse([B)Lcom/android/internal/telephony/uicc/UiccTlvData;

    move-result-object v35

    .line 671
    .restart local v35    # "tlvData":Lcom/android/internal/telephony/uicc/UiccTlvData;
    move-object/from16 v0, v35

    iget v3, v0, Lcom/android/internal/telephony/uicc/UiccTlvData;->mFileSize:I

    if-gez v3, :cond_e

    .line 672
    new-instance v3, Lcom/android/internal/telephony/uicc/IccFileTypeMismatch;

    invoke-direct {v3}, Lcom/android/internal/telephony/uicc/IccFileTypeMismatch;-><init>()V

    throw v3

    .line 785
    .end local v35    # "tlvData":Lcom/android/internal/telephony/uicc/UiccTlvData;
    :catch_1
    move-exception v29

    goto/16 :goto_2

    .line 675
    .restart local v35    # "tlvData":Lcom/android/internal/telephony/uicc/UiccTlvData;
    :cond_e
    move-object/from16 v0, v35

    iget v9, v0, Lcom/android/internal/telephony/uicc/UiccTlvData;->mFileSize:I

    .line 690
    .end local v35    # "tlvData":Lcom/android/internal/telephony/uicc/UiccTlvData;
    .restart local v9    # "size":I
    :goto_6
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v4, 0xb0

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/android/internal/telephony/uicc/IccFileHandler;->getEFPath(I)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mAid:Ljava/lang/String;

    const/4 v14, 0x5

    const/4 v15, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v33

    invoke-virtual {v0, v14, v5, v15, v1}, Lcom/android/internal/telephony/uicc/IccFileHandler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v14

    invoke-interface/range {v3 .. v14}, Lcom/android/internal/telephony/CommandsInterface;->iccIOForAppEx(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ILandroid/os/Message;)V

    goto/16 :goto_1

    .line 678
    .end local v9    # "size":I
    :cond_f
    const/4 v3, 0x4

    const/4 v4, 0x6

    aget-byte v4, v28, v4

    if-ne v3, v4, :cond_11

    .line 680
    const/16 v3, 0xd

    aget-byte v3, v28, v3

    if-eqz v3, :cond_10

    .line 681
    new-instance v3, Lcom/android/internal/telephony/uicc/IccFileTypeMismatch;

    invoke-direct {v3}, Lcom/android/internal/telephony/uicc/IccFileTypeMismatch;-><init>()V

    throw v3

    .line 684
    :cond_10
    const/4 v3, 0x2

    aget-byte v3, v28, v3

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v3, v3, 0x8

    const/4 v4, 0x3

    aget-byte v4, v28, v4

    and-int/lit16 v4, v4, 0xff

    add-int v9, v3, v4

    .restart local v9    # "size":I
    goto :goto_6

    .line 687
    .end local v9    # "size":I
    :cond_11
    new-instance v3, Lcom/android/internal/telephony/uicc/IccFileTypeMismatch;

    invoke-direct {v3}, Lcom/android/internal/telephony/uicc/IccFileTypeMismatch;-><init>()V

    throw v3
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 699
    .end local v5    # "fileid":I
    .end local v13    # "channel":I
    .end local v26    # "ar":Landroid/os/AsyncResult;
    .end local v28    # "data":[B
    .end local v34    # "result":Lcom/android/internal/telephony/uicc/IccIoResult;
    .restart local v27    # "channel":I
    :pswitch_3
    :try_start_3
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v26, v0

    check-cast v26, Landroid/os/AsyncResult;

    .line 700
    .restart local v26    # "ar":Landroid/os/AsyncResult;
    move-object/from16 v0, v26

    iget-object v0, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    move-object/from16 v30, v0

    check-cast v30, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;

    .line 701
    .restart local v30    # "lc":Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;
    move-object/from16 v0, v26

    iget-object v0, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    move-object/from16 v34, v0

    check-cast v34, Lcom/android/internal/telephony/uicc/IccIoResult;

    .line 702
    .restart local v34    # "result":Lcom/android/internal/telephony/uicc/IccIoResult;
    move-object/from16 v0, v30

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mOnLoaded:Landroid/os/Message;

    move-object/from16 v33, v0

    .line 703
    move-object/from16 v0, v30

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mPath:Ljava/lang/String;

    move-object/from16 v31, v0

    .line 705
    move-object/from16 v0, p1

    iget-object v3, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Landroid/os/AsyncResult;

    move-object/from16 v0, p0

    move-object/from16 v1, v33

    invoke-direct {v0, v1, v3}, Lcom/android/internal/telephony/uicc/IccFileHandler;->processException(Landroid/os/Message;Landroid/os/AsyncResult;)Z

    move-result v3

    if-eqz v3, :cond_12

    move/from16 v13, v27

    .line 706
    .end local v27    # "channel":I
    .restart local v13    # "channel":I
    goto/16 :goto_1

    .line 709
    .end local v13    # "channel":I
    .restart local v27    # "channel":I
    :cond_12
    move-object/from16 v0, v30

    iget-boolean v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mLoadAll:Z

    if-eqz v3, :cond_16

    .line 710
    move-object/from16 v0, v30

    iget-object v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->results:Ljava/util/ArrayList;

    move-object/from16 v0, v34

    iget-object v4, v0, Lcom/android/internal/telephony/uicc/IccIoResult;->payload:[B

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 712
    move-object/from16 v0, v30

    iget v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mRecordNum:I

    add-int/lit8 v3, v3, 0x1

    move-object/from16 v0, v30

    iput v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mRecordNum:I

    .line 714
    move-object/from16 v0, v30

    iget v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mRecordNum:I

    move-object/from16 v0, v30

    iget v4, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mCountRecords:I

    if-le v3, v4, :cond_13

    .line 715
    move-object/from16 v0, v30

    iget-object v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->results:Ljava/util/ArrayList;

    const/4 v4, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v33

    invoke-direct {v0, v1, v3, v4}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V

    move/from16 v13, v27

    .end local v27    # "channel":I
    .restart local v13    # "channel":I
    goto/16 :goto_1

    .line 717
    .end local v13    # "channel":I
    .restart local v27    # "channel":I
    :cond_13
    if-nez v31, :cond_14

    .line 718
    move-object/from16 v0, v30

    iget v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mEfid:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/android/internal/telephony/uicc/IccFileHandler;->getEFPath(I)Ljava/lang/String;

    move-result-object v31

    .line 721
    :cond_14
    move-object/from16 v0, v30

    iget v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mMode:I

    const/4 v4, -0x1

    if-eq v3, v4, :cond_15

    .line 722
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v15, 0xb2

    move-object/from16 v0, v30

    iget v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mEfid:I

    move/from16 v16, v0

    move-object/from16 v0, v30

    iget v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mMode:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/android/internal/telephony/uicc/IccFileHandler;->getSmsEFPath(I)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v30

    iget v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mRecordNum:I

    move/from16 v18, v0

    const/16 v19, 0x4

    move-object/from16 v0, v30

    iget v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mRecordSize:I

    move/from16 v20, v0

    const/16 v21, 0x0

    const/16 v22, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mAid:Ljava/lang/String;

    move-object/from16 v23, v0

    move-object/from16 v0, v30

    iget v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mChannel:I

    move/from16 v24, v0

    const/4 v3, 0x7

    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-virtual {v0, v3, v1}, Lcom/android/internal/telephony/uicc/IccFileHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v25

    invoke-interface/range {v14 .. v25}, Lcom/android/internal/telephony/CommandsInterface;->iccIOForAppEx(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ILandroid/os/Message;)V

    move/from16 v13, v27

    .end local v27    # "channel":I
    .restart local v13    # "channel":I
    goto/16 :goto_1

    .line 729
    .end local v13    # "channel":I
    .restart local v27    # "channel":I
    :cond_15
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v15, 0xb2

    move-object/from16 v0, v30

    iget v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mEfid:I

    move/from16 v16, v0

    move-object/from16 v0, v30

    iget v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mRecordNum:I

    move/from16 v18, v0

    const/16 v19, 0x4

    move-object/from16 v0, v30

    iget v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mRecordSize:I

    move/from16 v20, v0

    const/16 v21, 0x0

    const/16 v22, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mAid:Ljava/lang/String;

    move-object/from16 v23, v0

    move-object/from16 v0, v30

    iget v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mChannel:I

    move/from16 v24, v0

    const/4 v3, 0x7

    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-virtual {v0, v3, v1}, Lcom/android/internal/telephony/uicc/IccFileHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v25

    move-object/from16 v17, v31

    invoke-interface/range {v14 .. v25}, Lcom/android/internal/telephony/CommandsInterface;->iccIOForAppEx(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ILandroid/os/Message;)V

    move/from16 v13, v27

    .end local v27    # "channel":I
    .restart local v13    # "channel":I
    goto/16 :goto_1

    .line 736
    .end local v13    # "channel":I
    .restart local v27    # "channel":I
    :cond_16
    move-object/from16 v0, v30

    iget-boolean v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mLoadPart:Z

    if-eqz v3, :cond_1b

    .line 737
    move-object/from16 v0, v30

    iget-object v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->results:Ljava/util/ArrayList;

    move-object/from16 v0, v30

    iget v4, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mRecordNum:I

    add-int/lit8 v4, v4, -0x1

    move-object/from16 v0, v34

    iget-object v6, v0, Lcom/android/internal/telephony/uicc/IccIoResult;->payload:[B

    invoke-virtual {v3, v4, v6}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 738
    move-object/from16 v0, v30

    iget v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mCount:I

    add-int/lit8 v3, v3, 0x1

    move-object/from16 v0, v30

    iput v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mCount:I

    .line 739
    move-object/from16 v0, v30

    iget v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mCount:I

    move-object/from16 v0, v30

    iget v4, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mCountLoadrecords:I

    if-ge v3, v4, :cond_1a

    .line 740
    move-object/from16 v0, v30

    iget-object v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mRecordNums:Ljava/util/ArrayList;

    move-object/from16 v0, v30

    iget v4, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mCount:I

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    move-object/from16 v0, v30

    iput v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mRecordNum:I

    .line 741
    move-object/from16 v0, v30

    iget v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mRecordNum:I

    move-object/from16 v0, v30

    iget v4, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mCountRecords:I

    if-gt v3, v4, :cond_19

    .line 742
    if-nez v31, :cond_17

    .line 743
    move-object/from16 v0, v30

    iget v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mEfid:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/android/internal/telephony/uicc/IccFileHandler;->getEFPath(I)Ljava/lang/String;

    move-result-object v31

    .line 745
    :cond_17
    move-object/from16 v0, v30

    iget v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mMode:I

    const/4 v4, -0x1

    if-eq v3, v4, :cond_18

    .line 746
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v15, 0xb2

    move-object/from16 v0, v30

    iget v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mEfid:I

    move/from16 v16, v0

    move-object/from16 v0, v30

    iget v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mMode:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/android/internal/telephony/uicc/IccFileHandler;->getSmsEFPath(I)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v30

    iget v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mRecordNum:I

    move/from16 v18, v0

    const/16 v19, 0x4

    move-object/from16 v0, v30

    iget v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mRecordSize:I

    move/from16 v20, v0

    const/16 v21, 0x0

    const/16 v22, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mAid:Ljava/lang/String;

    move-object/from16 v23, v0

    move-object/from16 v0, v30

    iget v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mChannel:I

    move/from16 v24, v0

    const/4 v3, 0x7

    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-virtual {v0, v3, v1}, Lcom/android/internal/telephony/uicc/IccFileHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v25

    invoke-interface/range {v14 .. v25}, Lcom/android/internal/telephony/CommandsInterface;->iccIOForAppEx(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ILandroid/os/Message;)V

    move/from16 v13, v27

    .end local v27    # "channel":I
    .restart local v13    # "channel":I
    goto/16 :goto_1

    .line 753
    .end local v13    # "channel":I
    .restart local v27    # "channel":I
    :cond_18
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v15, 0xb2

    move-object/from16 v0, v30

    iget v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mEfid:I

    move/from16 v16, v0

    move-object/from16 v0, v30

    iget v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mRecordNum:I

    move/from16 v18, v0

    const/16 v19, 0x4

    move-object/from16 v0, v30

    iget v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mRecordSize:I

    move/from16 v20, v0

    const/16 v21, 0x0

    const/16 v22, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mAid:Ljava/lang/String;

    move-object/from16 v23, v0

    move-object/from16 v0, v30

    iget v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mChannel:I

    move/from16 v24, v0

    const/4 v3, 0x7

    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-virtual {v0, v3, v1}, Lcom/android/internal/telephony/uicc/IccFileHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v25

    move-object/from16 v17, v31

    invoke-interface/range {v14 .. v25}, Lcom/android/internal/telephony/CommandsInterface;->iccIOForAppEx(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ILandroid/os/Message;)V

    move/from16 v13, v27

    .end local v27    # "channel":I
    .restart local v13    # "channel":I
    goto/16 :goto_1

    .line 760
    .end local v13    # "channel":I
    .restart local v27    # "channel":I
    :cond_19
    move-object/from16 v0, v30

    iget-object v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->results:Ljava/util/ArrayList;

    const/4 v4, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v33

    invoke-direct {v0, v1, v3, v4}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V

    move/from16 v13, v27

    .end local v27    # "channel":I
    .restart local v13    # "channel":I
    goto/16 :goto_1

    .line 763
    .end local v13    # "channel":I
    .restart local v27    # "channel":I
    :cond_1a
    move-object/from16 v0, v30

    iget-object v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->results:Ljava/util/ArrayList;

    const/4 v4, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v33

    invoke-direct {v0, v1, v3, v4}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V

    move/from16 v13, v27

    .end local v27    # "channel":I
    .restart local v13    # "channel":I
    goto/16 :goto_1

    .line 767
    .end local v13    # "channel":I
    .restart local v27    # "channel":I
    :cond_1b
    move-object/from16 v0, v34

    iget-object v3, v0, Lcom/android/internal/telephony/uicc/IccIoResult;->payload:[B

    const/4 v4, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v33

    invoke-direct {v0, v1, v3, v4}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V

    move/from16 v13, v27

    .line 770
    .end local v27    # "channel":I
    .restart local v13    # "channel":I
    goto/16 :goto_1

    .line 774
    .end local v13    # "channel":I
    .end local v26    # "ar":Landroid/os/AsyncResult;
    .end local v30    # "lc":Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;
    .end local v34    # "result":Lcom/android/internal/telephony/uicc/IccIoResult;
    .restart local v27    # "channel":I
    :pswitch_4
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v26, v0

    check-cast v26, Landroid/os/AsyncResult;

    .line 775
    .restart local v26    # "ar":Landroid/os/AsyncResult;
    move-object/from16 v0, v26

    iget-object v3, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    move-object v0, v3

    check-cast v0, Landroid/os/Message;

    move-object/from16 v33, v0

    .line 776
    move-object/from16 v0, v26

    iget-object v0, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    move-object/from16 v34, v0

    check-cast v34, Lcom/android/internal/telephony/uicc/IccIoResult;

    .line 778
    .restart local v34    # "result":Lcom/android/internal/telephony/uicc/IccIoResult;
    move-object/from16 v0, p1

    iget-object v3, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Landroid/os/AsyncResult;

    move-object/from16 v0, p0

    move-object/from16 v1, v33

    invoke-direct {v0, v1, v3}, Lcom/android/internal/telephony/uicc/IccFileHandler;->processException(Landroid/os/Message;Landroid/os/AsyncResult;)Z

    move-result v3

    if-eqz v3, :cond_1c

    move/from16 v13, v27

    .line 779
    .end local v27    # "channel":I
    .restart local v13    # "channel":I
    goto/16 :goto_1

    .line 782
    .end local v13    # "channel":I
    .restart local v27    # "channel":I
    :cond_1c
    move-object/from16 v0, v34

    iget-object v3, v0, Lcom/android/internal/telephony/uicc/IccIoResult;->payload:[B

    const/4 v4, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v33

    invoke-direct {v0, v1, v3, v4}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto/16 :goto_0

    .line 789
    .end local v26    # "ar":Landroid/os/AsyncResult;
    .end local v27    # "channel":I
    .end local v34    # "result":Lcom/android/internal/telephony/uicc/IccIoResult;
    .restart local v13    # "channel":I
    .restart local v29    # "exc":Ljava/lang/Exception;
    :cond_1d
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "uncaught exception"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v29

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/android/internal/telephony/uicc/IccFileHandler;->loge(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 543
    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_2
        :pswitch_4
        :pswitch_1
        :pswitch_3
        :pswitch_0
        :pswitch_3
        :pswitch_4
        :pswitch_1
    .end packed-switch
.end method

.method public loadEFImgLinearFixed(ILandroid/os/Message;)V
    .locals 11
    .param p1, "recordNum"    # I
    .param p2, "onLoaded"    # Landroid/os/Message;

    .prologue
    const/4 v7, 0x0

    const/16 v2, 0x4f20

    .line 277
    const/16 v0, 0xb

    new-instance v1, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;

    invoke-direct {v1, v2, p1, p2}, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;-><init>(IILandroid/os/Message;)V

    invoke-virtual {p0, v0, v1}, Lcom/android/internal/telephony/uicc/IccFileHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v10

    .line 281
    .local v10, "response":Landroid/os/Message;
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v1, 0xc0

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/uicc/IccFileHandler;->getEFPath(I)Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x4

    const/16 v6, 0xa

    iget-object v9, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mAid:Ljava/lang/String;

    move v4, p1

    move-object v8, v7

    invoke-interface/range {v0 .. v10}, Lcom/android/internal/telephony/CommandsInterface;->iccIOForApp(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    .line 285
    return-void
.end method

.method public loadEFImgTransparent(IIIILandroid/os/Message;)V
    .locals 12
    .param p1, "fileid"    # I
    .param p2, "highOffset"    # I
    .param p3, "lowOffset"    # I
    .param p4, "length"    # I
    .param p5, "onLoaded"    # Landroid/os/Message;

    .prologue
    .line 431
    const/16 v1, 0xa

    const/4 v2, 0x0

    move-object/from16 v0, p5

    invoke-virtual {p0, v1, p1, v2, v0}, Lcom/android/internal/telephony/uicc/IccFileHandler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v11

    .line 434
    .local v11, "response":Landroid/os/Message;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "IccFileHandler: loadEFImgTransparent fileid = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " filePath = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x4f20

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/uicc/IccFileHandler;->getEFPath(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " highOffset = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " lowOffset = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " length = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move/from16 v0, p4

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/uicc/IccFileHandler;->logd(Ljava/lang/String;)V

    .line 444
    iget-object v1, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v2, 0xb0

    const/16 v3, 0x4f20

    invoke-virtual {p0, v3}, Lcom/android/internal/telephony/uicc/IccFileHandler;->getEFPath(I)Ljava/lang/String;

    move-result-object v4

    const/4 v8, 0x0

    const/4 v9, 0x0

    iget-object v10, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mAid:Ljava/lang/String;

    move v3, p1

    move v5, p2

    move v6, p3

    move/from16 v7, p4

    invoke-interface/range {v1 .. v11}, Lcom/android/internal/telephony/CommandsInterface;->iccIOForApp(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    .line 446
    return-void
.end method

.method public loadEFLinearFixed(IILandroid/os/Message;)V
    .locals 1
    .param p1, "fileid"    # I
    .param p2, "recordNum"    # I
    .param p3, "onLoaded"    # Landroid/os/Message;

    .prologue
    .line 264
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/uicc/IccFileHandler;->getEFPath(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0, p2, p3}, Lcom/android/internal/telephony/uicc/IccFileHandler;->loadEFLinearFixed(ILjava/lang/String;ILandroid/os/Message;)V

    .line 265
    return-void
.end method

.method public loadEFLinearFixed(ILjava/lang/String;ILandroid/os/Message;)V
    .locals 11
    .param p1, "fileid"    # I
    .param p2, "path"    # Ljava/lang/String;
    .param p3, "recordNum"    # I
    .param p4, "onLoaded"    # Landroid/os/Message;

    .prologue
    const/4 v7, 0x0

    const/4 v4, 0x0

    .line 245
    const/4 v0, 0x6

    new-instance v1, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;

    invoke-direct {v1, p1, p3, p2, p4}, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;-><init>(IILjava/lang/String;Landroid/os/Message;)V

    invoke-virtual {p0, v0, v1}, Lcom/android/internal/telephony/uicc/IccFileHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v10

    .line 249
    .local v10, "response":Landroid/os/Message;
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v1, 0xc0

    const/16 v6, 0xf

    iget-object v9, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mAid:Ljava/lang/String;

    move v2, p1

    move-object v3, p2

    move v5, v4

    move-object v8, v7

    invoke-interface/range {v0 .. v10}, Lcom/android/internal/telephony/CommandsInterface;->iccIOForApp(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    .line 251
    return-void
.end method

.method public loadEFLinearFixedAll(IILandroid/os/Message;)V
    .locals 12
    .param p1, "fileid"    # I
    .param p2, "mode"    # I
    .param p3, "onLoaded"    # Landroid/os/Message;

    .prologue
    const/4 v7, 0x0

    const/4 v4, 0x0

    .line 847
    new-instance v11, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;

    invoke-direct {v11, p1, p3}, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;-><init>(ILandroid/os/Message;)V

    .line 848
    .local v11, "lc":Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;
    iput p2, v11, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mMode:I

    .line 849
    const/4 v0, 0x6

    invoke-virtual {p0, v0, v11}, Lcom/android/internal/telephony/uicc/IccFileHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v10

    .line 851
    .local v10, "response":Landroid/os/Message;
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v1, 0xc0

    invoke-virtual {p0, p2}, Lcom/android/internal/telephony/uicc/IccFileHandler;->getSmsEFPath(I)Ljava/lang/String;

    move-result-object v3

    const/16 v6, 0xf

    iget-object v9, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mAid:Ljava/lang/String;

    move v2, p1

    move v5, v4

    move-object v8, v7

    invoke-interface/range {v0 .. v10}, Lcom/android/internal/telephony/CommandsInterface;->iccIOForApp(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    .line 853
    return-void
.end method

.method public loadEFLinearFixedAll(ILandroid/os/Message;)V
    .locals 1
    .param p1, "fileid"    # I
    .param p2, "onLoaded"    # Landroid/os/Message;

    .prologue
    .line 328
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/uicc/IccFileHandler;->getEFPath(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0, p2}, Lcom/android/internal/telephony/uicc/IccFileHandler;->loadEFLinearFixedAll(ILjava/lang/String;Landroid/os/Message;)V

    .line 329
    return-void
.end method

.method public loadEFLinearFixedAll(ILandroid/os/Message;Z)V
    .locals 11
    .param p1, "fileid"    # I
    .param p2, "onLoaded"    # Landroid/os/Message;
    .param p3, "is7FFF"    # Z

    .prologue
    const/4 v7, 0x0

    const/4 v4, 0x0

    .line 839
    const/4 v0, 0x6

    new-instance v1, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;

    invoke-direct {v1, p1, p2}, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;-><init>(ILandroid/os/Message;)V

    invoke-virtual {p0, v0, v1}, Lcom/android/internal/telephony/uicc/IccFileHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v10

    .line 842
    .local v10, "response":Landroid/os/Message;
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v1, 0xc0

    invoke-virtual {p0, p1, p3}, Lcom/android/internal/telephony/uicc/IccFileHandler;->getEFPath(IZ)Ljava/lang/String;

    move-result-object v3

    const/16 v6, 0xf

    iget-object v9, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mAid:Ljava/lang/String;

    move v2, p1

    move v5, v4

    move-object v8, v7

    invoke-interface/range {v0 .. v10}, Lcom/android/internal/telephony/CommandsInterface;->iccIOForApp(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    .line 844
    return-void
.end method

.method public loadEFLinearFixedAll(ILjava/lang/String;Landroid/os/Message;)V
    .locals 11
    .param p1, "fileid"    # I
    .param p2, "path"    # Ljava/lang/String;
    .param p3, "onLoaded"    # Landroid/os/Message;

    .prologue
    const/4 v7, 0x0

    const/4 v4, 0x0

    .line 342
    const/4 v0, 0x6

    new-instance v1, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;

    invoke-direct {v1, p1, p2, p3}, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;-><init>(ILjava/lang/String;Landroid/os/Message;)V

    invoke-virtual {p0, v0, v1}, Lcom/android/internal/telephony/uicc/IccFileHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v10

    .line 345
    .local v10, "response":Landroid/os/Message;
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v1, 0xc0

    const/16 v6, 0xf

    iget-object v9, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mAid:Ljava/lang/String;

    move v2, p1

    move-object v3, p2

    move v5, v4

    move-object v8, v7

    invoke-interface/range {v0 .. v10}, Lcom/android/internal/telephony/CommandsInterface;->iccIOForApp(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    .line 347
    return-void
.end method

.method public loadEFLinearFixedAllEx(IILandroid/os/Message;)V
    .locals 12
    .param p1, "fileid"    # I
    .param p2, "channel"    # I
    .param p3, "onLoaded"    # Landroid/os/Message;

    .prologue
    const/4 v7, 0x0

    const/4 v4, 0x0

    .line 931
    const/4 v0, 0x6

    new-instance v1, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;

    invoke-direct {v1, p1, p3, p2}, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;-><init>(ILandroid/os/Message;I)V

    invoke-virtual {p0, v0, v1}, Lcom/android/internal/telephony/uicc/IccFileHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v11

    .line 934
    .local v11, "response":Landroid/os/Message;
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v1, 0xc0

    invoke-virtual {p0, p1, v4}, Lcom/android/internal/telephony/uicc/IccFileHandler;->getEFPath(IZ)Ljava/lang/String;

    move-result-object v3

    const/16 v6, 0xf

    iget-object v9, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mAid:Ljava/lang/String;

    move v2, p1

    move v5, v4

    move-object v8, v7

    move v10, p2

    invoke-interface/range {v0 .. v11}, Lcom/android/internal/telephony/CommandsInterface;->iccIOForAppEx(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ILandroid/os/Message;)V

    .line 936
    return-void
.end method

.method public loadEFLinearFixedEx(IIILandroid/os/Message;)V
    .locals 16
    .param p1, "fileid"    # I
    .param p2, "recordNum"    # I
    .param p3, "channel"    # I
    .param p4, "onLoaded"    # Landroid/os/Message;

    .prologue
    .line 923
    const/4 v4, 0x6

    new-instance v5, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;

    move/from16 v0, p1

    move/from16 v1, p2

    move-object/from16 v2, p4

    move/from16 v3, p3

    invoke-direct {v5, v0, v1, v2, v3}, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;-><init>(IILandroid/os/Message;I)V

    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v5}, Lcom/android/internal/telephony/uicc/IccFileHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v15

    .line 927
    .local v15, "response":Landroid/os/Message;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v5, 0xc0

    invoke-virtual/range {p0 .. p1}, Lcom/android/internal/telephony/uicc/IccFileHandler;->getEFPath(I)Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/16 v10, 0xf

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mAid:Ljava/lang/String;

    move/from16 v6, p1

    move/from16 v14, p3

    invoke-interface/range {v4 .. v15}, Lcom/android/internal/telephony/CommandsInterface;->iccIOForAppEx(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ILandroid/os/Message;)V

    .line 929
    return-void
.end method

.method public loadEFLinearFixedPart(ILjava/lang/String;Ljava/util/ArrayList;Landroid/os/Message;)V
    .locals 11
    .param p1, "fileid"    # I
    .param p2, "path"    # Ljava/lang/String;
    .param p4, "onLoaded"    # Landroid/os/Message;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;",
            "Landroid/os/Message;",
            ")V"
        }
    .end annotation

    .prologue
    .local p3, "recordNums":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    const/4 v7, 0x0

    const/4 v4, 0x0

    .line 376
    const/4 v0, 0x6

    new-instance v1, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;

    invoke-direct {v1, p1, p3, p2, p4}, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;-><init>(ILjava/util/ArrayList;Ljava/lang/String;Landroid/os/Message;)V

    invoke-virtual {p0, v0, v1}, Lcom/android/internal/telephony/uicc/IccFileHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v10

    .line 379
    .local v10, "response":Landroid/os/Message;
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v1, 0xc0

    const/16 v6, 0xf

    iget-object v9, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mAid:Ljava/lang/String;

    move v2, p1

    move-object v3, p2

    move v5, v4

    move-object v8, v7

    invoke-interface/range {v0 .. v10}, Lcom/android/internal/telephony/CommandsInterface;->iccIOForApp(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    .line 381
    return-void
.end method

.method public loadEFLinearFixedPart(ILjava/util/ArrayList;Landroid/os/Message;)V
    .locals 1
    .param p1, "fileid"    # I
    .param p3, "onLoaded"    # Landroid/os/Message;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;",
            "Landroid/os/Message;",
            ")V"
        }
    .end annotation

    .prologue
    .line 361
    .local p2, "recordNums":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/uicc/IccFileHandler;->getEFPath(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0, p2, p3}, Lcom/android/internal/telephony/uicc/IccFileHandler;->loadEFLinearFixedPart(ILjava/lang/String;Ljava/util/ArrayList;Landroid/os/Message;)V

    .line 362
    return-void
.end method

.method public loadEFTransparent(IILandroid/os/Message;)V
    .locals 11
    .param p1, "fileid"    # I
    .param p2, "size"    # I
    .param p3, "onLoaded"    # Landroid/os/Message;

    .prologue
    const/4 v7, 0x0

    const/4 v4, 0x0

    .line 412
    const/4 v0, 0x5

    invoke-virtual {p0, v0, p1, v4, p3}, Lcom/android/internal/telephony/uicc/IccFileHandler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v10

    .line 415
    .local v10, "response":Landroid/os/Message;
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v1, 0xb0

    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/uicc/IccFileHandler;->getEFPath(I)Ljava/lang/String;

    move-result-object v3

    iget-object v9, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mAid:Ljava/lang/String;

    move v2, p1

    move v5, v4

    move v6, p2

    move-object v8, v7

    invoke-interface/range {v0 .. v10}, Lcom/android/internal/telephony/CommandsInterface;->iccIOForApp(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    .line 417
    return-void
.end method

.method public loadEFTransparent(ILandroid/os/Message;)V
    .locals 11
    .param p1, "fileid"    # I
    .param p2, "onLoaded"    # Landroid/os/Message;

    .prologue
    const/4 v7, 0x0

    const/4 v4, 0x0

    .line 394
    const/4 v0, 0x4

    invoke-virtual {p0, v0, p1, v4, p2}, Lcom/android/internal/telephony/uicc/IccFileHandler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v10

    .line 397
    .local v10, "response":Landroid/os/Message;
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v1, 0xc0

    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/uicc/IccFileHandler;->getEFPath(I)Ljava/lang/String;

    move-result-object v3

    iget-object v9, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mAid:Ljava/lang/String;

    move v2, p1

    move v5, v4

    move v6, v4

    move-object v8, v7

    invoke-interface/range {v0 .. v10}, Lcom/android/internal/telephony/CommandsInterface;->iccIOForApp(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    .line 399
    return-void
.end method

.method public loadEFTransparent(ILjava/lang/String;Landroid/os/Message;)V
    .locals 11
    .param p1, "fileid"    # I
    .param p2, "efPath"    # Ljava/lang/String;
    .param p3, "onLoaded"    # Landroid/os/Message;

    .prologue
    const/4 v7, 0x0

    const/4 v4, 0x0

    .line 880
    const/4 v0, 0x4

    invoke-virtual {p0, v0, p1, v4, p3}, Lcom/android/internal/telephony/uicc/IccFileHandler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v10

    .line 883
    .local v10, "response":Landroid/os/Message;
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v1, 0xc0

    const/16 v6, 0xf

    iget-object v9, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mAid:Ljava/lang/String;

    move v2, p1

    move-object v3, p2

    move v5, v4

    move-object v8, v7

    invoke-interface/range {v0 .. v10}, Lcom/android/internal/telephony/CommandsInterface;->iccIOForApp(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    .line 885
    return-void
.end method

.method public loadEFTransparentEx(IILandroid/os/Message;)V
    .locals 12
    .param p1, "fileid"    # I
    .param p2, "channel"    # I
    .param p3, "onLoaded"    # Landroid/os/Message;

    .prologue
    const/4 v7, 0x0

    const/4 v4, 0x0

    .line 915
    const/4 v0, 0x4

    invoke-virtual {p0, v0, p1, p2, p3}, Lcom/android/internal/telephony/uicc/IccFileHandler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v11

    .line 918
    .local v11, "response":Landroid/os/Message;
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v1, 0xc0

    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/uicc/IccFileHandler;->getEFPath(I)Ljava/lang/String;

    move-result-object v3

    const/16 v6, 0xf

    iget-object v9, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mAid:Ljava/lang/String;

    move v2, p1

    move v5, v4

    move-object v8, v7

    move v10, p2

    invoke-interface/range {v0 .. v11}, Lcom/android/internal/telephony/CommandsInterface;->iccIOForAppEx(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ILandroid/os/Message;)V

    .line 920
    return-void
.end method

.method protected abstract logd(Ljava/lang/String;)V
.end method

.method protected abstract loge(Ljava/lang/String;)V
.end method

.method public needsFakeIccid()Z
    .locals 2

    .prologue
    .line 829
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const-string v1, "fakeiccid"

    invoke-interface {v0, v1}, Lcom/android/internal/telephony/CommandsInterface;->needsOldRilFeature(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public selectEFFile(ILandroid/os/Message;)V
    .locals 11
    .param p1, "fileid"    # I
    .param p2, "onLoaded"    # Landroid/os/Message;

    .prologue
    const/4 v7, 0x0

    const/4 v4, 0x0

    .line 896
    const/16 v0, 0x64

    invoke-virtual {p0, v0, p1, v4, p2}, Lcom/android/internal/telephony/uicc/IccFileHandler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v10

    .line 899
    .local v10, "response":Landroid/os/Message;
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v1, 0xc0

    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/uicc/IccFileHandler;->getEFPath(I)Ljava/lang/String;

    move-result-object v3

    const/16 v6, 0xf

    iget-object v9, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mAid:Ljava/lang/String;

    move v2, p1

    move v5, v4

    move-object v8, v7

    invoke-interface/range {v0 .. v10}, Lcom/android/internal/telephony/CommandsInterface;->iccIOForApp(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    .line 901
    return-void
.end method

.method public updateEFLinearFixed(II[BLjava/lang/String;Landroid/os/Message;)V
    .locals 11
    .param p1, "fileid"    # I
    .param p2, "recordNum"    # I
    .param p3, "data"    # [B
    .param p4, "pin2"    # Ljava/lang/String;
    .param p5, "onComplete"    # Landroid/os/Message;

    .prologue
    .line 476
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v1, 0xdc

    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/uicc/IccFileHandler;->getEFPath(I)Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x4

    array-length v6, p3

    invoke-static {p3}, Lcom/android/internal/telephony/uicc/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v7

    iget-object v9, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mAid:Ljava/lang/String;

    move v2, p1

    move v4, p2

    move-object v8, p4

    move-object/from16 v10, p5

    invoke-interface/range {v0 .. v10}, Lcom/android/internal/telephony/CommandsInterface;->iccIOForApp(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    .line 479
    return-void
.end method

.method public updateEFLinearFixed(ILjava/lang/String;I[BLjava/lang/String;Landroid/os/Message;)V
    .locals 11
    .param p1, "fileid"    # I
    .param p2, "path"    # Ljava/lang/String;
    .param p3, "recordNum"    # I
    .param p4, "data"    # [B
    .param p5, "pin2"    # Ljava/lang/String;
    .param p6, "onComplete"    # Landroid/os/Message;

    .prologue
    .line 460
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v1, 0xdc

    const/4 v5, 0x4

    array-length v6, p4

    invoke-static {p4}, Lcom/android/internal/telephony/uicc/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v7

    iget-object v9, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mAid:Ljava/lang/String;

    move v2, p1

    move-object v3, p2

    move v4, p3

    move-object/from16 v8, p5

    move-object/from16 v10, p6

    invoke-interface/range {v0 .. v10}, Lcom/android/internal/telephony/CommandsInterface;->iccIOForApp(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    .line 463
    return-void
.end method

.method public updateEFTransparent(I[BLandroid/os/Message;)V
    .locals 11
    .param p1, "fileid"    # I
    .param p2, "data"    # [B
    .param p3, "onComplete"    # Landroid/os/Message;

    .prologue
    const/4 v4, 0x0

    .line 487
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v1, 0xd6

    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/uicc/IccFileHandler;->getEFPath(I)Ljava/lang/String;

    move-result-object v3

    array-length v6, p2

    invoke-static {p2}, Lcom/android/internal/telephony/uicc/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    iget-object v9, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mAid:Ljava/lang/String;

    move v2, p1

    move v5, v4

    move-object v10, p3

    invoke-interface/range {v0 .. v10}, Lcom/android/internal/telephony/CommandsInterface;->iccIOForApp(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    .line 490
    return-void
.end method

.method public updateEFTransparentEx(II[BLandroid/os/Message;)V
    .locals 12
    .param p1, "fileid"    # I
    .param p2, "channel"    # I
    .param p3, "data"    # [B
    .param p4, "onComplete"    # Landroid/os/Message;

    .prologue
    .line 939
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v1, 0xd6

    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/uicc/IccFileHandler;->getEFPath(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    array-length v6, p3

    invoke-static {p3}, Lcom/android/internal/telephony/uicc/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    iget-object v9, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mAid:Ljava/lang/String;

    move v2, p1

    move v10, p2

    move-object/from16 v11, p4

    invoke-interface/range {v0 .. v11}, Lcom/android/internal/telephony/CommandsInterface;->iccIOForAppEx(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ILandroid/os/Message;)V

    .line 942
    return-void
.end method
