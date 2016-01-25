.class Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;
.super Ljava/lang/Object;
.source "MediaTekRIL.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/telephony/MediaTekRIL;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "dtmfQueueHandler"
.end annotation


# instance fields
.field private final DTMF_STATUS_START:Z

.field private final DTMF_STATUS_STOP:Z

.field public final MAXIMUM_DTMF_REQUEST:I

.field private mDtmfQueue:Ljava/util/Vector;

.field private mDtmfStatus:Z

.field private mIsSendChldRequest:Z

.field private mPendingCHLDRequest:Lcom/android/internal/telephony/RILRequest;

.field final synthetic this$0:Lcom/android/internal/telephony/MediaTekRIL;


# direct methods
.method public constructor <init>(Lcom/android/internal/telephony/MediaTekRIL;)V
    .locals 3

    .prologue
    const/16 v2, 0x20

    const/4 v1, 0x0

    .line 59
    iput-object p1, p0, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->this$0:Lcom/android/internal/telephony/MediaTekRIL;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 116
    iput v2, p0, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->MAXIMUM_DTMF_REQUEST:I

    .line 117
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->DTMF_STATUS_START:Z

    .line 118
    iput-boolean v1, p0, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->DTMF_STATUS_STOP:Z

    .line 120
    iput-boolean v1, p0, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->mDtmfStatus:Z

    .line 121
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0, v2}, Ljava/util/Vector;-><init>(I)V

    iput-object v0, p0, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->mDtmfQueue:Ljava/util/Vector;

    .line 123
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->mPendingCHLDRequest:Lcom/android/internal/telephony/RILRequest;

    .line 124
    iput-boolean v1, p0, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->mIsSendChldRequest:Z

    .line 60
    iput-boolean v1, p0, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->mDtmfStatus:Z

    .line 61
    return-void
.end method


# virtual methods
.method public add(Lcom/android/internal/telephony/RILRequest;)V
    .locals 1
    .param p1, "o"    # Lcom/android/internal/telephony/RILRequest;

    .prologue
    .line 76
    iget-object v0, p0, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->mDtmfQueue:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 77
    return-void
.end method

.method public get()Lcom/android/internal/telephony/RILRequest;
    .locals 2

    .prologue
    .line 88
    iget-object v0, p0, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->mDtmfQueue:Ljava/util/Vector;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/RILRequest;

    return-object v0
.end method

.method public getPendingRequest()Lcom/android/internal/telephony/RILRequest;
    .locals 1

    .prologue
    .line 100
    iget-object v0, p0, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->mPendingCHLDRequest:Lcom/android/internal/telephony/RILRequest;

    return-object v0
.end method

.method public hasSendChldRequest()Z
    .locals 3

    .prologue
    .line 112
    iget-object v0, p0, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->this$0:Lcom/android/internal/telephony/MediaTekRIL;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mIsSendChldRequest = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->mIsSendChldRequest:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/MediaTekRIL;->riljLog(Ljava/lang/String;)V

    .line 113
    iget-boolean v0, p0, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->mIsSendChldRequest:Z

    return v0
.end method

.method public isStart()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 72
    iget-boolean v1, p0, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->mDtmfStatus:Z

    if-ne v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public remove(I)V
    .locals 1
    .param p1, "idx"    # I

    .prologue
    .line 84
    iget-object v0, p0, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->mDtmfQueue:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->removeElementAt(I)V

    .line 85
    return-void
.end method

.method public remove(Lcom/android/internal/telephony/RILRequest;)V
    .locals 1
    .param p1, "o"    # Lcom/android/internal/telephony/RILRequest;

    .prologue
    .line 80
    iget-object v0, p0, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->mDtmfQueue:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->remove(Ljava/lang/Object;)Z

    .line 81
    return-void
.end method

.method public resetSendChldRequest()V
    .locals 1

    .prologue
    .line 108
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->mIsSendChldRequest:Z

    .line 109
    return-void
.end method

.method public setPendingRequest(Lcom/android/internal/telephony/RILRequest;)V
    .locals 0
    .param p1, "r"    # Lcom/android/internal/telephony/RILRequest;

    .prologue
    .line 96
    iput-object p1, p0, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->mPendingCHLDRequest:Lcom/android/internal/telephony/RILRequest;

    .line 97
    return-void
.end method

.method public setSendChldRequest()V
    .locals 1

    .prologue
    .line 104
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->mIsSendChldRequest:Z

    .line 105
    return-void
.end method

.method public size()I
    .locals 1

    .prologue
    .line 92
    iget-object v0, p0, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->mDtmfQueue:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    return v0
.end method

.method public start()V
    .locals 1

    .prologue
    .line 64
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->mDtmfStatus:Z

    .line 65
    return-void
.end method

.method public stop()V
    .locals 1

    .prologue
    .line 68
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->mDtmfStatus:Z

    .line 69
    return-void
.end method
