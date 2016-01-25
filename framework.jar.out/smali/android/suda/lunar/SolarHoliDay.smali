.class public Landroid/suda/lunar/SolarHoliDay;
.super Ljava/lang/Object;
.source "SolarHoliDay.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getSolarHoliDay(II)Ljava/lang/String;
    .locals 11
    .param p0, "currentMonth"    # I
    .param p1, "currentDayForMonth"    # I

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 27
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v2

    .line 28
    .local v2, "res":Landroid/content/res/Resources;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "%02d"

    new-array v7, v10, [Ljava/lang/Object;

    add-int/lit8 v8, p0, 0x1

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v9

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "%02d"

    new-array v7, v10, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v9

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 29
    .local v1, "num_date":Ljava/lang/String;
    const v5, 0x1070061

    invoke-virtual {v2, v5}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v3

    .line 30
    .local v3, "solarHolidayArray":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v5, v3

    if-ge v0, v5, :cond_1

    .line 31
    aget-object v5, v3, v0

    const-string v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 32
    .local v4, "solarHolidayDateStr":[Ljava/lang/String;
    aget-object v5, v4, v9

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 33
    aget-object v5, v4, v10

    .line 36
    .end local v4    # "solarHolidayDateStr":[Ljava/lang/String;
    :goto_1
    return-object v5

    .line 30
    .restart local v4    # "solarHolidayDateStr":[Ljava/lang/String;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 36
    .end local v4    # "solarHolidayDateStr":[Ljava/lang/String;
    :cond_1
    const-string v5, ""

    goto :goto_1
.end method
