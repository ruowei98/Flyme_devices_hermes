.class public Lcom/android/internal/widget/LockGestureView;
.super Landroid/gesture/GestureOverlayView;
.source "LockGestureView.java"

# interfaces
.implements Landroid/gesture/GestureOverlayView$OnGesturingListener;
.implements Landroid/gesture/GestureOverlayView$OnGesturePerformedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/widget/LockGestureView$1;,
        Lcom/android/internal/widget/LockGestureView$DisplayMode;,
        Lcom/android/internal/widget/LockGestureView$OnLockGestureListener;
    }
.end annotation


# static fields
.field private static final CORRECT_COLOR:I = -0xffff01

.field private static final WRONG_COLOR:I = -0x10000


# instance fields
.field private mGestureDisplayMode:Lcom/android/internal/widget/LockGestureView$DisplayMode;

.field private mInStealthMode:Z

.field private mOnGestureListener:Lcom/android/internal/widget/LockGestureView$OnLockGestureListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 72
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/internal/widget/LockGestureView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 73
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v1, 0x0

    .line 76
    invoke-direct {p0, p1, p2}, Landroid/gesture/GestureOverlayView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 14
    sget-object v0, Lcom/android/internal/widget/LockGestureView$DisplayMode;->Correct:Lcom/android/internal/widget/LockGestureView$DisplayMode;

    iput-object v0, p0, Lcom/android/internal/widget/LockGestureView;->mGestureDisplayMode:Lcom/android/internal/widget/LockGestureView$DisplayMode;

    .line 15
    iput-boolean v1, p0, Lcom/android/internal/widget/LockGestureView;->mInStealthMode:Z

    .line 77
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/internal/widget/LockGestureView;->setGestureVisible(Z)V

    .line 78
    invoke-virtual {p0, p0}, Lcom/android/internal/widget/LockGestureView;->addOnGesturingListener(Landroid/gesture/GestureOverlayView$OnGesturingListener;)V

    .line 79
    invoke-virtual {p0, p0}, Lcom/android/internal/widget/LockGestureView;->addOnGesturePerformedListener(Landroid/gesture/GestureOverlayView$OnGesturePerformedListener;)V

    .line 80
    const v0, -0xffff01

    invoke-virtual {p0, v0}, Lcom/android/internal/widget/LockGestureView;->setGestureColor(I)V

    .line 81
    iput-boolean v1, p0, Lcom/android/internal/widget/LockGestureView;->mClearPerformedGesture:Z

    .line 82
    return-void
.end method

.method private notifyGestureCleared()V
    .locals 1

    .prologue
    .line 168
    iget-object v0, p0, Lcom/android/internal/widget/LockGestureView;->mOnGestureListener:Lcom/android/internal/widget/LockGestureView$OnLockGestureListener;

    if-eqz v0, :cond_0

    .line 169
    iget-object v0, p0, Lcom/android/internal/widget/LockGestureView;->mOnGestureListener:Lcom/android/internal/widget/LockGestureView$OnLockGestureListener;

    invoke-interface {v0}, Lcom/android/internal/widget/LockGestureView$OnLockGestureListener;->onGestureCleared()V

    .line 170
    :cond_0
    return-void
.end method

.method private notifyGestureDetected(Landroid/gesture/Gesture;)V
    .locals 1
    .param p1, "gesture"    # Landroid/gesture/Gesture;

    .prologue
    .line 173
    iget-object v0, p0, Lcom/android/internal/widget/LockGestureView;->mOnGestureListener:Lcom/android/internal/widget/LockGestureView$OnLockGestureListener;

    if-eqz v0, :cond_0

    .line 174
    iget-object v0, p0, Lcom/android/internal/widget/LockGestureView;->mOnGestureListener:Lcom/android/internal/widget/LockGestureView$OnLockGestureListener;

    invoke-interface {v0, p1}, Lcom/android/internal/widget/LockGestureView$OnLockGestureListener;->onGestureDetected(Landroid/gesture/Gesture;)V

    .line 175
    :cond_0
    return-void
.end method

.method private notifyGestureStart()V
    .locals 1

    .prologue
    .line 163
    iget-object v0, p0, Lcom/android/internal/widget/LockGestureView;->mOnGestureListener:Lcom/android/internal/widget/LockGestureView$OnLockGestureListener;

    if-eqz v0, :cond_0

    .line 164
    iget-object v0, p0, Lcom/android/internal/widget/LockGestureView;->mOnGestureListener:Lcom/android/internal/widget/LockGestureView$OnLockGestureListener;

    invoke-interface {v0}, Lcom/android/internal/widget/LockGestureView$OnLockGestureListener;->onGestureStart()V

    .line 165
    :cond_0
    return-void
.end method

.method private resetGesture()V
    .locals 1

    .prologue
    .line 148
    sget-object v0, Lcom/android/internal/widget/LockGestureView$DisplayMode;->Correct:Lcom/android/internal/widget/LockGestureView$DisplayMode;

    iput-object v0, p0, Lcom/android/internal/widget/LockGestureView;->mGestureDisplayMode:Lcom/android/internal/widget/LockGestureView$DisplayMode;

    .line 149
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/internal/widget/LockGestureView;->clear(Z)V

    .line 150
    invoke-virtual {p0}, Lcom/android/internal/widget/LockGestureView;->invalidate()V

    .line 151
    return-void
.end method


# virtual methods
.method public clearGesture()V
    .locals 0

    .prologue
    .line 141
    invoke-direct {p0}, Lcom/android/internal/widget/LockGestureView;->resetGesture()V

    .line 142
    return-void
.end method

.method public disableInput()V
    .locals 1

    .prologue
    .line 127
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/internal/widget/LockGestureView;->mInputEnabled:Z

    .line 128
    return-void
.end method

.method public enableInput()V
    .locals 1

    .prologue
    .line 134
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/internal/widget/LockGestureView;->mInputEnabled:Z

    .line 135
    return-void
.end method

.method public isInStealthMode()Z
    .locals 1

    .prologue
    .line 88
    iget-boolean v0, p0, Lcom/android/internal/widget/LockGestureView;->mInStealthMode:Z

    return v0
.end method

.method public onGesturePerformed(Landroid/gesture/GestureOverlayView;Landroid/gesture/Gesture;)V
    .locals 0
    .param p1, "gestureOverlayView"    # Landroid/gesture/GestureOverlayView;
    .param p2, "gesture"    # Landroid/gesture/Gesture;

    .prologue
    .line 21
    invoke-direct {p0, p2}, Lcom/android/internal/widget/LockGestureView;->notifyGestureDetected(Landroid/gesture/Gesture;)V

    .line 22
    return-void
.end method

.method public onGesturingEnded(Landroid/gesture/GestureOverlayView;)V
    .locals 0
    .param p1, "gestureOverlayView"    # Landroid/gesture/GestureOverlayView;

    .prologue
    .line 31
    return-void
.end method

.method public onGesturingStarted(Landroid/gesture/GestureOverlayView;)V
    .locals 0
    .param p1, "gestureOverlayView"    # Landroid/gesture/GestureOverlayView;

    .prologue
    .line 26
    invoke-direct {p0}, Lcom/android/internal/widget/LockGestureView;->notifyGestureStart()V

    .line 27
    return-void
.end method

.method public setDisplayMode(Lcom/android/internal/widget/LockGestureView$DisplayMode;)V
    .locals 2
    .param p1, "displayMode"    # Lcom/android/internal/widget/LockGestureView$DisplayMode;

    .prologue
    .line 109
    iput-object p1, p0, Lcom/android/internal/widget/LockGestureView;->mGestureDisplayMode:Lcom/android/internal/widget/LockGestureView$DisplayMode;

    .line 110
    sget-object v0, Lcom/android/internal/widget/LockGestureView$1;->$SwitchMap$com$android$internal$widget$LockGestureView$DisplayMode:[I

    invoke-virtual {p1}, Lcom/android/internal/widget/LockGestureView$DisplayMode;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 119
    :goto_0
    invoke-virtual {p0}, Lcom/android/internal/widget/LockGestureView;->invalidate()V

    .line 120
    return-void

    .line 112
    :pswitch_0
    const v0, -0xffff01

    invoke-virtual {p0, v0}, Lcom/android/internal/widget/LockGestureView;->setGestureColor(I)V

    goto :goto_0

    .line 115
    :pswitch_1
    const/high16 v0, -0x10000

    invoke-virtual {p0, v0}, Lcom/android/internal/widget/LockGestureView;->setGestureColor(I)V

    goto :goto_0

    .line 110
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public setInStealthMode(Z)V
    .locals 1
    .param p1, "inStealthMode"    # Z

    .prologue
    .line 98
    iput-boolean p1, p0, Lcom/android/internal/widget/LockGestureView;->mInStealthMode:Z

    .line 99
    if-nez p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p0, v0}, Lcom/android/internal/widget/LockGestureView;->setGestureVisible(Z)V

    .line 100
    return-void

    .line 99
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setOnGestureListener(Lcom/android/internal/widget/LockGestureView$OnLockGestureListener;)V
    .locals 0
    .param p1, "onGestureListener"    # Lcom/android/internal/widget/LockGestureView$OnLockGestureListener;

    .prologue
    .line 159
    iput-object p1, p0, Lcom/android/internal/widget/LockGestureView;->mOnGestureListener:Lcom/android/internal/widget/LockGestureView$OnLockGestureListener;

    .line 160
    return-void
.end method
