.class public final enum Lcom/android/internal/widget/LockGestureView$DisplayMode;
.super Ljava/lang/Enum;
.source "LockGestureView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/widget/LockGestureView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "DisplayMode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/android/internal/widget/LockGestureView$DisplayMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/android/internal/widget/LockGestureView$DisplayMode;

.field public static final enum Correct:Lcom/android/internal/widget/LockGestureView$DisplayMode;

.field public static final enum Wrong:Lcom/android/internal/widget/LockGestureView$DisplayMode;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 63
    new-instance v0, Lcom/android/internal/widget/LockGestureView$DisplayMode;

    const-string v1, "Correct"

    invoke-direct {v0, v1, v2}, Lcom/android/internal/widget/LockGestureView$DisplayMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/internal/widget/LockGestureView$DisplayMode;->Correct:Lcom/android/internal/widget/LockGestureView$DisplayMode;

    .line 68
    new-instance v0, Lcom/android/internal/widget/LockGestureView$DisplayMode;

    const-string v1, "Wrong"

    invoke-direct {v0, v1, v3}, Lcom/android/internal/widget/LockGestureView$DisplayMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/internal/widget/LockGestureView$DisplayMode;->Wrong:Lcom/android/internal/widget/LockGestureView$DisplayMode;

    .line 58
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/android/internal/widget/LockGestureView$DisplayMode;

    sget-object v1, Lcom/android/internal/widget/LockGestureView$DisplayMode;->Correct:Lcom/android/internal/widget/LockGestureView$DisplayMode;

    aput-object v1, v0, v2

    sget-object v1, Lcom/android/internal/widget/LockGestureView$DisplayMode;->Wrong:Lcom/android/internal/widget/LockGestureView$DisplayMode;

    aput-object v1, v0, v3

    sput-object v0, Lcom/android/internal/widget/LockGestureView$DisplayMode;->$VALUES:[Lcom/android/internal/widget/LockGestureView$DisplayMode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 58
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/android/internal/widget/LockGestureView$DisplayMode;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 58
    const-class v0, Lcom/android/internal/widget/LockGestureView$DisplayMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/android/internal/widget/LockGestureView$DisplayMode;

    return-object v0
.end method

.method public static values()[Lcom/android/internal/widget/LockGestureView$DisplayMode;
    .locals 1

    .prologue
    .line 58
    sget-object v0, Lcom/android/internal/widget/LockGestureView$DisplayMode;->$VALUES:[Lcom/android/internal/widget/LockGestureView$DisplayMode;

    invoke-virtual {v0}, [Lcom/android/internal/widget/LockGestureView$DisplayMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/android/internal/widget/LockGestureView$DisplayMode;

    return-object v0
.end method
