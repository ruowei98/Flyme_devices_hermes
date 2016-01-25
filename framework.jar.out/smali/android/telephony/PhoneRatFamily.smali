.class public Landroid/telephony/PhoneRatFamily;
.super Ljava/lang/Object;
.source "PhoneRatFamily.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Landroid/telephony/PhoneRatFamily;",
            ">;"
        }
    .end annotation
.end field

.field public static final PHONE_RAT_FAMILY_2G:I = 0x1

.field public static final PHONE_RAT_FAMILY_3G:I = 0x2

.field public static final PHONE_RAT_FAMILY_4G:I = 0x4

.field public static final PHONE_RAT_FAMILY_NONE:I


# instance fields
.field private mPhoneId:I

.field private mRatFamily:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 99
    new-instance v0, Landroid/telephony/PhoneRatFamily$1;

    invoke-direct {v0}, Landroid/telephony/PhoneRatFamily$1;-><init>()V

    sput-object v0, Landroid/telephony/PhoneRatFamily;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(II)V
    .locals 0
    .param p1, "phoneId"    # I
    .param p2, "ratFamily"    # I

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput p1, p0, Landroid/telephony/PhoneRatFamily;->mPhoneId:I

    .line 46
    iput p2, p0, Landroid/telephony/PhoneRatFamily;->mRatFamily:I

    .line 47
    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 82
    const/4 v0, 0x0

    return v0
.end method

.method public getPhoneId()I
    .locals 1

    .prologue
    .line 55
    iget v0, p0, Landroid/telephony/PhoneRatFamily;->mPhoneId:I

    return v0
.end method

.method public getRatFamily()I
    .locals 1

    .prologue
    .line 64
    iget v0, p0, Landroid/telephony/PhoneRatFamily;->mRatFamily:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 69
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "{ mPhoneId = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Landroid/telephony/PhoneRatFamily;->mPhoneId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", mRatFamily = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Landroid/telephony/PhoneRatFamily;->mRatFamily:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "}"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 72
    .local v0, "ret":Ljava/lang/String;
    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "outParcel"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 92
    iget v0, p0, Landroid/telephony/PhoneRatFamily;->mPhoneId:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 93
    iget v0, p0, Landroid/telephony/PhoneRatFamily;->mRatFamily:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 94
    return-void
.end method
