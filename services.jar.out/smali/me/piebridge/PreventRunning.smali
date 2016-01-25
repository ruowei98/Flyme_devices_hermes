.class public Lme/piebridge/PreventRunning;
.super Ljava/lang/Object;
.source "PreventRunning.java"

# interfaces
.implements Lme/piebridge/PreventRunningHook;


# static fields
.field private static APKS:[Ljava/lang/String; = null

.field private static final TAG:Ljava/lang/String; = "Prevent"

.field private static final VERSION:I = 0x1337baa


# instance fields
.field private mPreventRunning:Lme/piebridge/PreventRunningHook;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 28
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "/data/app/me.piebridge.forcestopgb-1/base.apk"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "/data/app/me.piebridge.forcestopgb-2/base.apk"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "/data/app/me.piebridge.forcestopgb-3/base.apk"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "/data/app/me.piebridge.forcestopgb-1.apk"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "/data/app/me.piebridge.forcestopgb-2.apk"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "/data/app/me.piebridge.forcestopgb-3.apk"

    aput-object v2, v0, v1

    sput-object v0, Lme/piebridge/PreventRunning;->APKS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 6

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    sget-object v1, Lme/piebridge/PreventRunning;->APKS:[Ljava/lang/String;

    .local v1, "arr$":[Ljava/lang/String;
    array-length v4, v1

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_0

    aget-object v0, v1, v3

    .line 39
    .local v0, "apk":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 40
    .local v2, "file":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-direct {p0, v2}, Lme/piebridge/PreventRunning;->initPreventRunning(Ljava/io/File;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 44
    .end local v0    # "apk":Ljava/lang/String;
    .end local v2    # "file":Ljava/io/File;
    :cond_0
    return-void

    .line 38
    .restart local v0    # "apk":Ljava/lang/String;
    .restart local v2    # "file":Ljava/io/File;
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method private initPreventRunning(Ljava/io/File;)Z
    .locals 7
    .param p1, "apk"    # Ljava/io/File;

    .prologue
    .line 48
    :try_start_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    .line 49
    .local v1, "currentClassLoader":Ljava/lang/ClassLoader;
    new-instance v0, Ldalvik/system/DexClassLoader;

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    const-string v5, "/cache"

    const/4 v6, 0x0

    invoke-direct {v0, v4, v5, v6, v1}, Ldalvik/system/DexClassLoader;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/ClassLoader;)V

    .line 50
    .local v0, "classLoader":Ljava/lang/ClassLoader;
    const-string v4, "Prevent"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "loading PreventRunning(20151210) from "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    const-string v4, "me.piebridge.prevent.framework.PreventRunning"

    invoke-virtual {v0, v4}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lme/piebridge/PreventRunningHook;

    iput-object v4, p0, Lme/piebridge/PreventRunning;->mPreventRunning:Lme/piebridge/PreventRunningHook;

    .line 52
    invoke-direct {p0}, Lme/piebridge/PreventRunning;->setVersion()V

    .line 53
    invoke-direct {p0}, Lme/piebridge/PreventRunning;->setMethod()V
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_3

    .line 54
    const/4 v4, 0x1

    .line 64
    .end local v0    # "classLoader":Ljava/lang/ClassLoader;
    .end local v1    # "currentClassLoader":Ljava/lang/ClassLoader;
    :goto_0
    return v4

    .line 55
    :catch_0
    move-exception v2

    .line 56
    .local v2, "e":Ljava/lang/ClassNotFoundException;
    const-string v4, "Prevent"

    const-string v5, "cannot find class"

    invoke-static {v4, v5, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 64
    .end local v2    # "e":Ljava/lang/ClassNotFoundException;
    :goto_1
    const/4 v4, 0x0

    goto :goto_0

    .line 57
    :catch_1
    move-exception v2

    .line 58
    .local v2, "e":Ljava/lang/InstantiationException;
    const-string v4, "Prevent"

    const-string v5, "cannot instance class"

    invoke-static {v4, v5, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 59
    .end local v2    # "e":Ljava/lang/InstantiationException;
    :catch_2
    move-exception v2

    .line 60
    .local v2, "e":Ljava/lang/IllegalAccessException;
    const-string v4, "Prevent"

    const-string v5, "cannot access class"

    invoke-static {v4, v5, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 61
    .end local v2    # "e":Ljava/lang/IllegalAccessException;
    :catch_3
    move-exception v3

    .line 62
    .local v3, "t":Ljava/lang/Throwable;
    const-string v4, "Prevent"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "cannot load PreventRunning from "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1
.end method

.method private setMethod()V
    .locals 7

    .prologue
    .line 172
    :try_start_0
    iget-object v2, p0, Lme/piebridge/PreventRunning;->mPreventRunning:Lme/piebridge/PreventRunningHook;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "setMethod"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Ljava/lang/String;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 173
    .local v1, "method":Ljava/lang/reflect/Method;
    iget-object v2, p0, Lme/piebridge/PreventRunning;->mPreventRunning:Lme/piebridge/PreventRunningHook;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "native"

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_2

    .line 181
    .end local v1    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return-void

    .line 174
    :catch_0
    move-exception v0

    .line 175
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    const-string v2, "Prevent"

    const-string v3, "cannot find method"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 176
    .end local v0    # "e":Ljava/lang/NoSuchMethodException;
    :catch_1
    move-exception v0

    .line 177
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    const-string v2, "Prevent"

    const-string v3, "cannot invoke target"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 178
    .end local v0    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_2
    move-exception v0

    .line 179
    .local v0, "e":Ljava/lang/IllegalAccessException;
    const-string v2, "Prevent"

    const-string v3, "illegal access"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private setVersion()V
    .locals 7

    .prologue
    .line 159
    :try_start_0
    iget-object v2, p0, Lme/piebridge/PreventRunning;->mPreventRunning:Lme/piebridge/PreventRunningHook;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "setVersion"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 160
    .local v1, "method":Ljava/lang/reflect/Method;
    iget-object v2, p0, Lme/piebridge/PreventRunning;->mPreventRunning:Lme/piebridge/PreventRunningHook;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const v5, 0x1337baa

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_2

    .line 168
    .end local v1    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return-void

    .line 161
    :catch_0
    move-exception v0

    .line 162
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    const-string v2, "Prevent"

    const-string v3, "cannot find method"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 163
    .end local v0    # "e":Ljava/lang/NoSuchMethodException;
    :catch_1
    move-exception v0

    .line 164
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    const-string v2, "Prevent"

    const-string v3, "cannot invoke target"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 165
    .end local v0    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_2
    move-exception v0

    .line 166
    .local v0, "e":Ljava/lang/IllegalAccessException;
    const-string v2, "Prevent"

    const-string v3, "illegal access"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method


# virtual methods
.method public hookStartProcessLocked(Landroid/content/Context;Landroid/content/pm/ApplicationInfo;Ljava/lang/String;Landroid/content/ComponentName;)Z
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "info"    # Landroid/content/pm/ApplicationInfo;
    .param p3, "hostingType"    # Ljava/lang/String;
    .param p4, "hostingName"    # Landroid/content/ComponentName;

    .prologue
    .line 145
    iget-object v0, p0, Lme/piebridge/PreventRunning;->mPreventRunning:Lme/piebridge/PreventRunningHook;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lme/piebridge/PreventRunning;->mPreventRunning:Lme/piebridge/PreventRunningHook;

    invoke-interface {v0, p1, p2, p3, p4}, Lme/piebridge/PreventRunningHook;->hookStartProcessLocked(Landroid/content/Context;Landroid/content/pm/ApplicationInfo;Ljava/lang/String;Landroid/content/ComponentName;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isExcludingStopped(Ljava/lang/String;)Z
    .locals 1
    .param p1, "action"    # Ljava/lang/String;

    .prologue
    .line 139
    iget-object v0, p0, Lme/piebridge/PreventRunning;->mPreventRunning:Lme/piebridge/PreventRunningHook;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lme/piebridge/PreventRunning;->mPreventRunning:Lme/piebridge/PreventRunningHook;

    invoke-interface {v0, p1}, Lme/piebridge/PreventRunningHook;->isExcludingStopped(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public match(ILjava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;Ljava/util/Set;)I
    .locals 8
    .param p1, "match"    # I
    .param p2, "filter"    # Ljava/lang/Object;
    .param p3, "action"    # Ljava/lang/String;
    .param p4, "type"    # Ljava/lang/String;
    .param p5, "scheme"    # Ljava/lang/String;
    .param p6, "data"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Landroid/net/Uri;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)I"
        }
    .end annotation

    .prologue
    .line 150
    .local p7, "categories":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    iget-object v0, p0, Lme/piebridge/PreventRunning;->mPreventRunning:Lme/piebridge/PreventRunningHook;

    if-eqz v0, :cond_0

    .line 151
    iget-object v0, p0, Lme/piebridge/PreventRunning;->mPreventRunning:Lme/piebridge/PreventRunningHook;

    move v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    move-object v7, p7

    invoke-interface/range {v0 .. v7}, Lme/piebridge/PreventRunningHook;->match(ILjava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;Ljava/util/Set;)I

    move-result p1

    .line 153
    .end local p1    # "match":I
    :cond_0
    return p1
.end method

.method public onAppDied(Ljava/lang/Object;)V
    .locals 1
    .param p1, "processRecord"    # Ljava/lang/Object;

    .prologue
    .line 104
    iget-object v0, p0, Lme/piebridge/PreventRunning;->mPreventRunning:Lme/piebridge/PreventRunningHook;

    if-eqz v0, :cond_0

    .line 105
    iget-object v0, p0, Lme/piebridge/PreventRunning;->mPreventRunning:Lme/piebridge/PreventRunningHook;

    invoke-interface {v0, p1}, Lme/piebridge/PreventRunningHook;->onAppDied(Ljava/lang/Object;)V

    .line 107
    :cond_0
    return-void
.end method

.method public onBroadcastIntent(Landroid/content/Intent;)V
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 76
    iget-object v0, p0, Lme/piebridge/PreventRunning;->mPreventRunning:Lme/piebridge/PreventRunningHook;

    if-eqz v0, :cond_0

    .line 77
    iget-object v0, p0, Lme/piebridge/PreventRunning;->mPreventRunning:Lme/piebridge/PreventRunningHook;

    invoke-interface {v0, p1}, Lme/piebridge/PreventRunningHook;->onBroadcastIntent(Landroid/content/Intent;)V

    .line 79
    :cond_0
    return-void
.end method

.method public onCleanUpRemovedTask(Ljava/lang/String;)V
    .locals 1
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 83
    iget-object v0, p0, Lme/piebridge/PreventRunning;->mPreventRunning:Lme/piebridge/PreventRunningHook;

    if-eqz v0, :cond_0

    .line 84
    iget-object v0, p0, Lme/piebridge/PreventRunning;->mPreventRunning:Lme/piebridge/PreventRunningHook;

    invoke-interface {v0, p1}, Lme/piebridge/PreventRunningHook;->onCleanUpRemovedTask(Ljava/lang/String;)V

    .line 86
    :cond_0
    return-void
.end method

.method public onDestroyActivity(Ljava/lang/Object;)V
    .locals 1
    .param p1, "activityRecord"    # Ljava/lang/Object;

    .prologue
    .line 132
    iget-object v0, p0, Lme/piebridge/PreventRunning;->mPreventRunning:Lme/piebridge/PreventRunningHook;

    if-eqz v0, :cond_0

    .line 133
    iget-object v0, p0, Lme/piebridge/PreventRunning;->mPreventRunning:Lme/piebridge/PreventRunningHook;

    invoke-interface {v0, p1}, Lme/piebridge/PreventRunningHook;->onDestroyActivity(Ljava/lang/Object;)V

    .line 135
    :cond_0
    return-void
.end method

.method public onLaunchActivity(Ljava/lang/Object;)V
    .locals 1
    .param p1, "activityRecord"    # Ljava/lang/Object;

    .prologue
    .line 111
    iget-object v0, p0, Lme/piebridge/PreventRunning;->mPreventRunning:Lme/piebridge/PreventRunningHook;

    if-eqz v0, :cond_0

    .line 112
    iget-object v0, p0, Lme/piebridge/PreventRunning;->mPreventRunning:Lme/piebridge/PreventRunningHook;

    invoke-interface {v0, p1}, Lme/piebridge/PreventRunningHook;->onLaunchActivity(Ljava/lang/Object;)V

    .line 114
    :cond_0
    return-void
.end method

.method public onMoveActivityTaskToBack(Ljava/lang/String;)V
    .locals 1
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 97
    iget-object v0, p0, Lme/piebridge/PreventRunning;->mPreventRunning:Lme/piebridge/PreventRunningHook;

    if-eqz v0, :cond_0

    .line 98
    iget-object v0, p0, Lme/piebridge/PreventRunning;->mPreventRunning:Lme/piebridge/PreventRunningHook;

    invoke-interface {v0, p1}, Lme/piebridge/PreventRunningHook;->onMoveActivityTaskToBack(Ljava/lang/String;)V

    .line 100
    :cond_0
    return-void
.end method

.method public onResumeActivity(Ljava/lang/Object;)V
    .locals 1
    .param p1, "activityRecord"    # Ljava/lang/Object;

    .prologue
    .line 118
    iget-object v0, p0, Lme/piebridge/PreventRunning;->mPreventRunning:Lme/piebridge/PreventRunningHook;

    if-eqz v0, :cond_0

    .line 119
    iget-object v0, p0, Lme/piebridge/PreventRunning;->mPreventRunning:Lme/piebridge/PreventRunningHook;

    invoke-interface {v0, p1}, Lme/piebridge/PreventRunningHook;->onResumeActivity(Ljava/lang/Object;)V

    .line 121
    :cond_0
    return-void
.end method

.method public onStartHomeActivity(Ljava/lang/String;)V
    .locals 1
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 90
    iget-object v0, p0, Lme/piebridge/PreventRunning;->mPreventRunning:Lme/piebridge/PreventRunningHook;

    if-eqz v0, :cond_0

    .line 91
    iget-object v0, p0, Lme/piebridge/PreventRunning;->mPreventRunning:Lme/piebridge/PreventRunningHook;

    invoke-interface {v0, p1}, Lme/piebridge/PreventRunningHook;->onStartHomeActivity(Ljava/lang/String;)V

    .line 93
    :cond_0
    return-void
.end method

.method public onUserLeavingActivity(Ljava/lang/Object;)V
    .locals 1
    .param p1, "activityRecord"    # Ljava/lang/Object;

    .prologue
    .line 125
    iget-object v0, p0, Lme/piebridge/PreventRunning;->mPreventRunning:Lme/piebridge/PreventRunningHook;

    if-eqz v0, :cond_0

    .line 126
    iget-object v0, p0, Lme/piebridge/PreventRunning;->mPreventRunning:Lme/piebridge/PreventRunningHook;

    invoke-interface {v0, p1}, Lme/piebridge/PreventRunningHook;->onUserLeavingActivity(Ljava/lang/Object;)V

    .line 128
    :cond_0
    return-void
.end method

.method public setSender(Ljava/lang/String;)V
    .locals 1
    .param p1, "sender"    # Ljava/lang/String;

    .prologue
    .line 69
    iget-object v0, p0, Lme/piebridge/PreventRunning;->mPreventRunning:Lme/piebridge/PreventRunningHook;

    if-eqz v0, :cond_0

    .line 70
    iget-object v0, p0, Lme/piebridge/PreventRunning;->mPreventRunning:Lme/piebridge/PreventRunningHook;

    invoke-interface {v0, p1}, Lme/piebridge/PreventRunningHook;->setSender(Ljava/lang/String;)V

    .line 72
    :cond_0
    return-void
.end method
