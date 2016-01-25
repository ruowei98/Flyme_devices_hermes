.class public Lcom/android/server/pm/PackageManagerService$IdmapException;
.super Ljava/lang/Exception;
.source "PackageManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/pm/PackageManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "IdmapException"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/pm/PackageManagerService;


# direct methods
.method public constructor <init>(Lcom/android/server/pm/PackageManagerService;Ljava/lang/String;)V
    .locals 0
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 7095
    iput-object p1, p0, Lcom/android/server/pm/PackageManagerService$IdmapException;->this$0:Lcom/android/server/pm/PackageManagerService;

    .line 7096
    invoke-direct {p0, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 7097
    return-void
.end method
