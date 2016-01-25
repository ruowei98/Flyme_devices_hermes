.class final Landroid/telephony/PhoneRatFamily$1;
.super Ljava/lang/Object;
.source "PhoneRatFamily.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/telephony/PhoneRatFamily;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator",
        "<",
        "Landroid/telephony/PhoneRatFamily;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 99
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Landroid/telephony/PhoneRatFamily;
    .locals 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 102
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 103
    .local v0, "phoneId":I
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 105
    .local v1, "ratFamily":I
    new-instance v2, Landroid/telephony/PhoneRatFamily;

    invoke-direct {v2, v0, v1}, Landroid/telephony/PhoneRatFamily;-><init>(II)V

    return-object v2
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 99
    invoke-virtual {p0, p1}, Landroid/telephony/PhoneRatFamily$1;->createFromParcel(Landroid/os/Parcel;)Landroid/telephony/PhoneRatFamily;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Landroid/telephony/PhoneRatFamily;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 110
    new-array v0, p1, [Landroid/telephony/PhoneRatFamily;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 99
    invoke-virtual {p0, p1}, Landroid/telephony/PhoneRatFamily$1;->newArray(I)[Landroid/telephony/PhoneRatFamily;

    move-result-object v0

    return-object v0
.end method
