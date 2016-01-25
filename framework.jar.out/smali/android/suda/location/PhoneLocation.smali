.class public final Landroid/suda/location/PhoneLocation;
.super Ljava/lang/Object;
.source "PhoneLocation.java"


# static fields
.field private static LIBPATH:Ljava/lang/String;

.field private static familyArray:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 27
    const/16 v0, 0x13

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "751"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "752"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "753"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "754"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "755"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "756"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "757"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "758"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "759"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "760"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "761"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "762"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "763"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "764"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "765"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string v2, "766"

    aput-object v2, v0, v1

    const/16 v1, 0x10

    const-string v2, "767"

    aput-object v2, v0, v1

    const/16 v1, 0x11

    const-string v2, "768"

    aput-object v2, v0, v1

    const/16 v1, 0x12

    const-string v2, "769"

    aput-object v2, v0, v1

    sput-object v0, Landroid/suda/location/PhoneLocation;->familyArray:[Ljava/lang/String;

    .line 37
    const-string/jumbo v0, "suda-phoneloc-jni"

    sput-object v0, Landroid/suda/location/PhoneLocation;->LIBPATH:Ljava/lang/String;

    .line 40
    sget-object v0, Landroid/suda/location/PhoneLocation;->LIBPATH:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 41
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static declared-synchronized doGetLocationFromPhone(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "number"    # Ljava/lang/String;

    .prologue
    .line 46
    const-class v1, Landroid/suda/location/PhoneLocation;

    monitor-enter v1

    :try_start_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 47
    :goto_0
    monitor-exit v1

    return-object v0

    :cond_0
    :try_start_1
    invoke-static {p0}, Landroid/suda/location/PhoneLocation;->getPhoneLocationJni(Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    goto :goto_0

    .line 46
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static getCityFromPhone(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "number"    # Ljava/lang/String;

    .prologue
    .line 74
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 75
    const-string v0, ""

    .line 78
    :cond_0
    :goto_0
    return-object v0

    .line 77
    :cond_1
    const-string v1, "(?:-| )"

    const-string v2, ""

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v1, v2}, Landroid/suda/location/PhoneLocation;->getPosFromPhone(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    .line 78
    .local v0, "phoneLocation":Ljava/lang/String;
    invoke-static {p0}, Landroid/suda/location/PhoneLocation;->getFamily(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {p0}, Landroid/suda/location/PhoneLocation;->getFamily(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static getCodeFromPhone(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "number"    # Ljava/lang/String;

    .prologue
    .line 70
    const-string v0, "(?:-| )"

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/suda/location/PhoneLocation;->getPosFromPhone(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getFamily(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "number"    # Ljava/lang/String;

    .prologue
    .line 61
    sget-object v0, Landroid/suda/location/PhoneLocation;->familyArray:[Ljava/lang/String;

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_1

    aget-object v3, v0, v1

    .line 62
    .local v3, "temp":Ljava/lang/String;
    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 63
    const-string/jumbo v4, "\u4eb2\u60c5\u53f7\u7801"

    .line 66
    .end local v3    # "temp":Ljava/lang/String;
    :goto_1
    return-object v4

    .line 61
    .restart local v3    # "temp":Ljava/lang/String;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 66
    .end local v3    # "temp":Ljava/lang/String;
    :cond_1
    const/4 v4, 0x0

    goto :goto_1
.end method

.method private static native getPhoneLocationJni(Ljava/lang/String;)Ljava/lang/String;
.end method

.method private static getPosFromPhone(Ljava/lang/String;I)Ljava/lang/String;
    .locals 4
    .param p0, "number"    # Ljava/lang/String;
    .param p1, "i"    # I

    .prologue
    .line 51
    invoke-static {p0}, Landroid/suda/location/PhoneLocation;->doGetLocationFromPhone(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 52
    .local v0, "s":Ljava/lang/String;
    const/4 v1, 0x0

    .line 53
    .local v1, "ss":[Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 54
    const-string v2, ","

    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 55
    array-length v2, v1

    const/4 v3, 0x2

    if-ne v2, v3, :cond_0

    aget-object v2, v1, p1

    .line 57
    :goto_0
    return-object v2

    :cond_0
    const-string v2, ""

    goto :goto_0
.end method
