.class public Lcom/android/server/am/PreventRunningUtils;
.super Ljava/lang/Object;
.source "PreventRunningUtils.java"


# static fields
.field private static mAm:Lcom/android/server/am/ActivityManagerService;

.field private static mPreventRunning:Lme/piebridge/PreventRunning;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 20
    new-instance v0, Lme/piebridge/PreventRunning;

    invoke-direct {v0}, Lme/piebridge/PreventRunning;-><init>()V

    sput-object v0, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lme/piebridge/PreventRunning;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    return-void
.end method

.method public static clearSenderInBindService(I)I
    .locals 2
    .param p0, "res"    # I

    .prologue
    .line 66
    sget-object v0, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lme/piebridge/PreventRunning;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lme/piebridge/PreventRunning;->setSender(Ljava/lang/String;)V

    .line 67
    return p0
.end method

.method public static clearSenderInStartService(Landroid/content/ComponentName;)Landroid/content/ComponentName;
    .locals 2
    .param p0, "res"    # Landroid/content/ComponentName;

    .prologue
    .line 57
    sget-object v0, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lme/piebridge/PreventRunning;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lme/piebridge/PreventRunning;->setSender(Ljava/lang/String;)V

    .line 58
    return-object p0
.end method

.method private static forToken(Landroid/os/IBinder;)Lcom/android/server/am/ActivityRecord;
    .locals 1
    .param p0, "token"    # Landroid/os/IBinder;

    .prologue
    .line 99
    invoke-static {p0}, Lcom/android/server/am/ActivityRecord;->forToken(Landroid/os/IBinder;)Lcom/android/server/am/ActivityRecord;

    move-result-object v0

    return-object v0
.end method

.method public static hookStartProcessLocked(Landroid/content/pm/ApplicationInfo;ZILjava/lang/String;Landroid/content/ComponentName;)Z
    .locals 2
    .param p0, "info"    # Landroid/content/pm/ApplicationInfo;
    .param p1, "knownToBeDead"    # Z
    .param p2, "intentFlags"    # I
    .param p3, "hostingType"    # Ljava/lang/String;
    .param p4, "hostingName"    # Landroid/content/ComponentName;

    .prologue
    .line 127
    sget-object v0, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lme/piebridge/PreventRunning;

    sget-object v1, Lcom/android/server/am/PreventRunningUtils;->mAm:Lcom/android/server/am/ActivityManagerService;

    iget-object v1, v1, Lcom/android/server/am/ActivityManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v1, p0, p3, p4}, Lme/piebridge/PreventRunning;->hookStartProcessLocked(Landroid/content/Context;Landroid/content/pm/ApplicationInfo;Ljava/lang/String;Landroid/content/ComponentName;)Z

    move-result v0

    return v0
.end method

.method public static init(Lcom/android/server/am/ActivityManagerService;)V
    .locals 0
    .param p0, "am"    # Lcom/android/server/am/ActivityManagerService;

    .prologue
    .line 26
    sput-object p0, Lcom/android/server/am/PreventRunningUtils;->mAm:Lcom/android/server/am/ActivityManagerService;

    .line 27
    return-void
.end method

.method public static isDep(Landroid/util/ArraySet;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/ArraySet",
            "<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 131
    .local p0, "pkgDeps":Landroid/util/ArraySet;, "Landroid/util/ArraySet<Ljava/lang/String;>;"
    const/4 v0, 0x0

    return v0
.end method

.method public static isExcludingStopped(Landroid/content/Intent;)Z
    .locals 2
    .param p0, "intent"    # Landroid/content/Intent;

    .prologue
    .line 103
    invoke-virtual {p0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 104
    .local v0, "action":Ljava/lang/String;
    invoke-virtual {p0}, Landroid/content/Intent;->isExcludingStopped()Z

    move-result v1

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    sget-object v1, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lme/piebridge/PreventRunning;

    invoke-virtual {v1, v0}, Lme/piebridge/PreventRunning;->isExcludingStopped(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static match(Landroid/content/IntentFilter;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;Ljava/util/Set;Ljava/lang/String;)I
    .locals 8
    .param p0, "filter"    # Landroid/content/IntentFilter;
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/String;
    .param p3, "scheme"    # Ljava/lang/String;
    .param p4, "data"    # Landroid/net/Uri;
    .param p6, "tag"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/IntentFilter;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Landroid/net/Uri;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")I"
        }
    .end annotation

    .prologue
    .line 108
    .local p5, "categories":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-virtual/range {p0 .. p6}, Landroid/content/IntentFilter;->match(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;Ljava/util/Set;Ljava/lang/String;)I

    move-result v1

    .line 109
    .local v1, "match":I
    if-ltz v1, :cond_0

    .line 110
    sget-object v0, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lme/piebridge/PreventRunning;

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    invoke-virtual/range {v0 .. v7}, Lme/piebridge/PreventRunning;->match(ILjava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;Ljava/util/Set;)I

    move-result v1

    .line 112
    .end local v1    # "match":I
    :cond_0
    return v1
.end method

.method public static onAppDied(Lcom/android/server/am/ProcessRecord;)V
    .locals 1
    .param p0, "app"    # Lcom/android/server/am/ProcessRecord;

    .prologue
    .line 83
    sget-object v0, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lme/piebridge/PreventRunning;

    invoke-virtual {v0, p0}, Lme/piebridge/PreventRunning;->onAppDied(Ljava/lang/Object;)V

    .line 84
    return-void
.end method

.method public static onBroadcastIntent(ILandroid/content/Intent;)I
    .locals 2
    .param p0, "res"    # I
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 75
    if-ltz p0, :cond_0

    .line 76
    sget-object v0, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lme/piebridge/PreventRunning;

    invoke-virtual {v0, p1}, Lme/piebridge/PreventRunning;->onBroadcastIntent(Landroid/content/Intent;)V

    .line 78
    :cond_0
    sget-object v0, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lme/piebridge/PreventRunning;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lme/piebridge/PreventRunning;->setSender(Ljava/lang/String;)V

    .line 79
    return p0
.end method

.method public static onCleanUpRemovedTask(Landroid/content/ComponentName;)V
    .locals 2
    .param p0, "component"    # Landroid/content/ComponentName;

    .prologue
    .line 87
    sget-object v0, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lme/piebridge/PreventRunning;

    invoke-virtual {p0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lme/piebridge/PreventRunning;->onCleanUpRemovedTask(Ljava/lang/String;)V

    .line 88
    return-void
.end method

.method public static onDestroyActivity(Lcom/android/server/am/ActivityRecord;)V
    .locals 1
    .param p0, "ar"    # Lcom/android/server/am/ActivityRecord;

    .prologue
    .line 40
    sget-object v0, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lme/piebridge/PreventRunning;

    invoke-virtual {v0, p0}, Lme/piebridge/PreventRunning;->onDestroyActivity(Ljava/lang/Object;)V

    .line 41
    return-void
.end method

.method public static onLaunchActivity(Lcom/android/server/am/ActivityRecord;)V
    .locals 1
    .param p0, "ar"    # Lcom/android/server/am/ActivityRecord;

    .prologue
    .line 44
    sget-object v0, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lme/piebridge/PreventRunning;

    invoke-virtual {v0, p0}, Lme/piebridge/PreventRunning;->onLaunchActivity(Ljava/lang/Object;)V

    .line 45
    return-void
.end method

.method public static onMoveActivityTaskToBack(ZLandroid/os/IBinder;)Z
    .locals 3
    .param p0, "res"    # Z
    .param p1, "token"    # Landroid/os/IBinder;

    .prologue
    .line 91
    if-eqz p0, :cond_0

    .line 92
    invoke-static {p1}, Lcom/android/server/am/PreventRunningUtils;->forToken(Landroid/os/IBinder;)Lcom/android/server/am/ActivityRecord;

    move-result-object v0

    .line 93
    .local v0, "ar":Lcom/android/server/am/ActivityRecord;
    sget-object v2, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lme/piebridge/PreventRunning;

    if-eqz v0, :cond_1

    iget-object v1, v0, Lcom/android/server/am/ActivityRecord;->packageName:Ljava/lang/String;

    :goto_0
    invoke-virtual {v2, v1}, Lme/piebridge/PreventRunning;->onMoveActivityTaskToBack(Ljava/lang/String;)V

    .line 95
    .end local v0    # "ar":Lcom/android/server/am/ActivityRecord;
    :cond_0
    return p0

    .line 93
    .restart local v0    # "ar":Lcom/android/server/am/ActivityRecord;
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static onResumeActivity(Lcom/android/server/am/ActivityRecord;)V
    .locals 1
    .param p0, "ar"    # Lcom/android/server/am/ActivityRecord;

    .prologue
    .line 36
    sget-object v0, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lme/piebridge/PreventRunning;

    invoke-virtual {v0, p0}, Lme/piebridge/PreventRunning;->onResumeActivity(Ljava/lang/Object;)V

    .line 37
    return-void
.end method

.method public static onStartActivity(ILandroid/app/IApplicationThread;Landroid/content/Intent;)I
    .locals 3
    .param p0, "res"    # I
    .param p1, "caller"    # Landroid/app/IApplicationThread;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 117
    if-ltz p0, :cond_0

    if-eqz p2, :cond_0

    const-string v1, "android.intent.category.HOME"

    invoke-virtual {p2, v1}, Landroid/content/Intent;->hasCategory(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 118
    sget-object v1, Lcom/android/server/am/PreventRunningUtils;->mAm:Lcom/android/server/am/ActivityManagerService;

    invoke-virtual {v1, p1}, Lcom/android/server/am/ActivityManagerService;->getRecordForAppLocked(Landroid/app/IApplicationThread;)Lcom/android/server/am/ProcessRecord;

    move-result-object v0

    .line 119
    .local v0, "callerApp":Lcom/android/server/am/ProcessRecord;
    if-eqz v0, :cond_0

    .line 120
    sget-object v1, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lme/piebridge/PreventRunning;

    iget-object v2, v0, Lcom/android/server/am/ProcessRecord;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v2, v2, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lme/piebridge/PreventRunning;->onStartHomeActivity(Ljava/lang/String;)V

    .line 123
    .end local v0    # "callerApp":Lcom/android/server/am/ProcessRecord;
    :cond_0
    return p0
.end method

.method public static onUserLeavingActivity(Lcom/android/server/am/ActivityRecord;Z)V
    .locals 1
    .param p0, "ar"    # Lcom/android/server/am/ActivityRecord;
    .param p1, "userLeaving"    # Z

    .prologue
    .line 30
    if-eqz p1, :cond_0

    .line 31
    sget-object v0, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lme/piebridge/PreventRunning;

    invoke-virtual {v0, p0}, Lme/piebridge/PreventRunning;->onUserLeavingActivity(Ljava/lang/Object;)V

    .line 33
    :cond_0
    return-void
.end method

.method private static setSender(Landroid/app/IApplicationThread;)V
    .locals 3
    .param p0, "caller"    # Landroid/app/IApplicationThread;

    .prologue
    .line 48
    sget-object v1, Lcom/android/server/am/PreventRunningUtils;->mAm:Lcom/android/server/am/ActivityManagerService;

    invoke-virtual {v1, p0}, Lcom/android/server/am/ActivityManagerService;->getRecordForAppLocked(Landroid/app/IApplicationThread;)Lcom/android/server/am/ProcessRecord;

    move-result-object v0

    .line 49
    .local v0, "callerApp":Lcom/android/server/am/ProcessRecord;
    sget-object v2, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lme/piebridge/PreventRunning;

    if-eqz v0, :cond_0

    iget-object v1, v0, Lcom/android/server/am/ProcessRecord;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    :goto_0
    invoke-virtual {v2, v1}, Lme/piebridge/PreventRunning;->setSender(Ljava/lang/String;)V

    .line 50
    return-void

    .line 49
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static setSenderInBindService(Landroid/app/IApplicationThread;)V
    .locals 0
    .param p0, "caller"    # Landroid/app/IApplicationThread;

    .prologue
    .line 62
    invoke-static {p0}, Lcom/android/server/am/PreventRunningUtils;->setSender(Landroid/app/IApplicationThread;)V

    .line 63
    return-void
.end method

.method public static setSenderInBroadcastIntent(Landroid/app/IApplicationThread;)V
    .locals 0
    .param p0, "caller"    # Landroid/app/IApplicationThread;

    .prologue
    .line 71
    invoke-static {p0}, Lcom/android/server/am/PreventRunningUtils;->setSender(Landroid/app/IApplicationThread;)V

    .line 72
    return-void
.end method

.method public static setSenderInStartService(Landroid/app/IApplicationThread;)V
    .locals 0
    .param p0, "caller"    # Landroid/app/IApplicationThread;

    .prologue
    .line 53
    invoke-static {p0}, Lcom/android/server/am/PreventRunningUtils;->setSender(Landroid/app/IApplicationThread;)V

    .line 54
    return-void
.end method
