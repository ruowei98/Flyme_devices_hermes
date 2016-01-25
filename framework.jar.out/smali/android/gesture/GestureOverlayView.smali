.class public Landroid/gesture/GestureOverlayView;
.super Landroid/widget/FrameLayout;
.source "GestureOverlayView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/gesture/GestureOverlayView$1;,
        Landroid/gesture/GestureOverlayView$OnGesturePerformedListener;,
        Landroid/gesture/GestureOverlayView$OnGestureListener;,
        Landroid/gesture/GestureOverlayView$OnGesturingListener;,
        Landroid/gesture/GestureOverlayView$FadeOutRunnable;
    }
.end annotation


# static fields
.field private static final DITHER_FLAG:Z = true

.field private static final FADE_ANIMATION_RATE:I = 0x10

.field private static final GESTURE_RENDERING_ANTIALIAS:Z = true

.field public static final GESTURE_STROKE_TYPE_MULTIPLE:I = 0x1

.field public static final GESTURE_STROKE_TYPE_SINGLE:I = 0x0

.field public static final ORIENTATION_HORIZONTAL:I = 0x0

.field public static final ORIENTATION_VERTICAL:I = 0x1


# instance fields
.field private mCertainGestureColor:I

.field protected mClearPerformedGesture:Z

.field private mCurrentColor:I

.field private mCurrentGesture:Landroid/gesture/Gesture;

.field private mCurveEndX:F

.field private mCurveEndY:F

.field private mFadeDuration:J

.field private mFadeEnabled:Z

.field private mFadeOffset:J

.field private mFadingAlpha:F

.field private mFadingHasStarted:Z

.field private final mFadingOut:Landroid/gesture/GestureOverlayView$FadeOutRunnable;

.field private mFadingStart:J

.field private final mGesturePaint:Landroid/graphics/Paint;

.field private mGestureStrokeAngleThreshold:F

.field private mGestureStrokeLengthThreshold:F

.field private mGestureStrokeSquarenessTreshold:F

.field private mGestureStrokeType:I

.field private mGestureStrokeWidth:F

.field private mGestureVisible:Z

.field private mHandleGestureActions:Z

.field protected mInputEnabled:Z

.field private mInterceptEvents:Z

.field private final mInterpolator:Landroid/view/animation/AccelerateDecelerateInterpolator;

.field private final mInvalidRect:Landroid/graphics/Rect;

.field private mInvalidateExtraBorder:I

.field private mIsFadingOut:Z

.field private mIsGesturing:Z

.field private mIsListeningForGestures:Z

.field private final mOnGestureListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/gesture/GestureOverlayView$OnGestureListener;",
            ">;"
        }
    .end annotation
.end field

.field private final mOnGesturePerformedListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/gesture/GestureOverlayView$OnGesturePerformedListener;",
            ">;"
        }
    .end annotation
.end field

.field private final mOnGesturingListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/gesture/GestureOverlayView$OnGesturingListener;",
            ">;"
        }
    .end annotation
.end field

.field private mOrientation:I

.field private final mPath:Landroid/graphics/Path;

.field private mPreviousWasGesturing:Z

.field private mResetGesture:Z

.field private final mStrokeBuffer:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/gesture/GesturePoint;",
            ">;"
        }
    .end annotation
.end field

.field private mTotalLength:F

.field private mUncertainGestureColor:I

.field private mX:F

.field private mY:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 131
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 66
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Landroid/gesture/GestureOverlayView;->mGesturePaint:Landroid/graphics/Paint;

    .line 68
    const-wide/16 v0, 0x96

    iput-wide v0, p0, Landroid/gesture/GestureOverlayView;->mFadeDuration:J

    .line 69
    const-wide/16 v0, 0x1a4

    iput-wide v0, p0, Landroid/gesture/GestureOverlayView;->mFadeOffset:J

    .line 72
    iput-boolean v2, p0, Landroid/gesture/GestureOverlayView;->mFadeEnabled:Z

    .line 75
    const/16 v0, -0x100

    iput v0, p0, Landroid/gesture/GestureOverlayView;->mCertainGestureColor:I

    .line 76
    const v0, 0x48ffff00    # 524280.0f

    iput v0, p0, Landroid/gesture/GestureOverlayView;->mUncertainGestureColor:I

    .line 77
    const/high16 v0, 0x41400000    # 12.0f

    iput v0, p0, Landroid/gesture/GestureOverlayView;->mGestureStrokeWidth:F

    .line 78
    const/16 v0, 0xa

    iput v0, p0, Landroid/gesture/GestureOverlayView;->mInvalidateExtraBorder:I

    .line 80
    iput v3, p0, Landroid/gesture/GestureOverlayView;->mGestureStrokeType:I

    .line 81
    const/high16 v0, 0x42480000    # 50.0f

    iput v0, p0, Landroid/gesture/GestureOverlayView;->mGestureStrokeLengthThreshold:F

    .line 82
    const v0, 0x3e8ccccd    # 0.275f

    iput v0, p0, Landroid/gesture/GestureOverlayView;->mGestureStrokeSquarenessTreshold:F

    .line 83
    const/high16 v0, 0x42200000    # 40.0f

    iput v0, p0, Landroid/gesture/GestureOverlayView;->mGestureStrokeAngleThreshold:F

    .line 85
    iput v2, p0, Landroid/gesture/GestureOverlayView;->mOrientation:I

    .line 87
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroid/gesture/GestureOverlayView;->mInvalidRect:Landroid/graphics/Rect;

    .line 88
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Landroid/gesture/GestureOverlayView;->mPath:Landroid/graphics/Path;

    .line 89
    iput-boolean v2, p0, Landroid/gesture/GestureOverlayView;->mGestureVisible:Z

    .line 90
    iput-boolean v2, p0, Landroid/gesture/GestureOverlayView;->mClearPerformedGesture:Z

    .line 91
    iput-boolean v2, p0, Landroid/gesture/GestureOverlayView;->mInputEnabled:Z

    .line 100
    iput-boolean v3, p0, Landroid/gesture/GestureOverlayView;->mIsGesturing:Z

    .line 101
    iput-boolean v3, p0, Landroid/gesture/GestureOverlayView;->mPreviousWasGesturing:Z

    .line 102
    iput-boolean v2, p0, Landroid/gesture/GestureOverlayView;->mInterceptEvents:Z

    .line 108
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0x64

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Landroid/gesture/GestureOverlayView;->mStrokeBuffer:Ljava/util/ArrayList;

    .line 111
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/gesture/GestureOverlayView;->mOnGestureListeners:Ljava/util/ArrayList;

    .line 114
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/gesture/GestureOverlayView;->mOnGesturePerformedListeners:Ljava/util/ArrayList;

    .line 117
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/gesture/GestureOverlayView;->mOnGesturingListeners:Ljava/util/ArrayList;

    .line 123
    iput-boolean v3, p0, Landroid/gesture/GestureOverlayView;->mIsFadingOut:Z

    .line 124
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Landroid/gesture/GestureOverlayView;->mFadingAlpha:F

    .line 125
    new-instance v0, Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    iput-object v0, p0, Landroid/gesture/GestureOverlayView;->mInterpolator:Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 128
    new-instance v0, Landroid/gesture/GestureOverlayView$FadeOutRunnable;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Landroid/gesture/GestureOverlayView$FadeOutRunnable;-><init>(Landroid/gesture/GestureOverlayView;Landroid/gesture/GestureOverlayView$1;)V

    iput-object v0, p0, Landroid/gesture/GestureOverlayView;->mFadingOut:Landroid/gesture/GestureOverlayView$FadeOutRunnable;

    .line 132
    invoke-direct {p0}, Landroid/gesture/GestureOverlayView;->init()V

    .line 133
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 136
    const v0, 0x1160014

    invoke-direct {p0, p1, p2, v0}, Landroid/gesture/GestureOverlayView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 137
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 140
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Landroid/gesture/GestureOverlayView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 141
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    const/16 v6, 0xa

    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 145
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 66
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    iput-object v1, p0, Landroid/gesture/GestureOverlayView;->mGesturePaint:Landroid/graphics/Paint;

    .line 68
    const-wide/16 v2, 0x96

    iput-wide v2, p0, Landroid/gesture/GestureOverlayView;->mFadeDuration:J

    .line 69
    const-wide/16 v2, 0x1a4

    iput-wide v2, p0, Landroid/gesture/GestureOverlayView;->mFadeOffset:J

    .line 72
    iput-boolean v4, p0, Landroid/gesture/GestureOverlayView;->mFadeEnabled:Z

    .line 75
    const/16 v1, -0x100

    iput v1, p0, Landroid/gesture/GestureOverlayView;->mCertainGestureColor:I

    .line 76
    const v1, 0x48ffff00    # 524280.0f

    iput v1, p0, Landroid/gesture/GestureOverlayView;->mUncertainGestureColor:I

    .line 77
    const/high16 v1, 0x41400000    # 12.0f

    iput v1, p0, Landroid/gesture/GestureOverlayView;->mGestureStrokeWidth:F

    .line 78
    iput v6, p0, Landroid/gesture/GestureOverlayView;->mInvalidateExtraBorder:I

    .line 80
    iput v5, p0, Landroid/gesture/GestureOverlayView;->mGestureStrokeType:I

    .line 81
    const/high16 v1, 0x42480000    # 50.0f

    iput v1, p0, Landroid/gesture/GestureOverlayView;->mGestureStrokeLengthThreshold:F

    .line 82
    const v1, 0x3e8ccccd    # 0.275f

    iput v1, p0, Landroid/gesture/GestureOverlayView;->mGestureStrokeSquarenessTreshold:F

    .line 83
    const/high16 v1, 0x42200000    # 40.0f

    iput v1, p0, Landroid/gesture/GestureOverlayView;->mGestureStrokeAngleThreshold:F

    .line 85
    iput v4, p0, Landroid/gesture/GestureOverlayView;->mOrientation:I

    .line 87
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Landroid/gesture/GestureOverlayView;->mInvalidRect:Landroid/graphics/Rect;

    .line 88
    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    iput-object v1, p0, Landroid/gesture/GestureOverlayView;->mPath:Landroid/graphics/Path;

    .line 89
    iput-boolean v4, p0, Landroid/gesture/GestureOverlayView;->mGestureVisible:Z

    .line 90
    iput-boolean v4, p0, Landroid/gesture/GestureOverlayView;->mClearPerformedGesture:Z

    .line 91
    iput-boolean v4, p0, Landroid/gesture/GestureOverlayView;->mInputEnabled:Z

    .line 100
    iput-boolean v5, p0, Landroid/gesture/GestureOverlayView;->mIsGesturing:Z

    .line 101
    iput-boolean v5, p0, Landroid/gesture/GestureOverlayView;->mPreviousWasGesturing:Z

    .line 102
    iput-boolean v4, p0, Landroid/gesture/GestureOverlayView;->mInterceptEvents:Z

    .line 108
    new-instance v1, Ljava/util/ArrayList;

    const/16 v2, 0x64

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v1, p0, Landroid/gesture/GestureOverlayView;->mStrokeBuffer:Ljava/util/ArrayList;

    .line 111
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Landroid/gesture/GestureOverlayView;->mOnGestureListeners:Ljava/util/ArrayList;

    .line 114
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Landroid/gesture/GestureOverlayView;->mOnGesturePerformedListeners:Ljava/util/ArrayList;

    .line 117
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Landroid/gesture/GestureOverlayView;->mOnGesturingListeners:Ljava/util/ArrayList;

    .line 123
    iput-boolean v5, p0, Landroid/gesture/GestureOverlayView;->mIsFadingOut:Z

    .line 124
    const/high16 v1, 0x3f800000    # 1.0f

    iput v1, p0, Landroid/gesture/GestureOverlayView;->mFadingAlpha:F

    .line 125
    new-instance v1, Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-direct {v1}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    iput-object v1, p0, Landroid/gesture/GestureOverlayView;->mInterpolator:Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 128
    new-instance v1, Landroid/gesture/GestureOverlayView$FadeOutRunnable;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Landroid/gesture/GestureOverlayView$FadeOutRunnable;-><init>(Landroid/gesture/GestureOverlayView;Landroid/gesture/GestureOverlayView$1;)V

    iput-object v1, p0, Landroid/gesture/GestureOverlayView;->mFadingOut:Landroid/gesture/GestureOverlayView$FadeOutRunnable;

    .line 147
    sget-object v1, Lcom/android/internal/R$styleable;->GestureOverlayView:[I

    invoke-virtual {p1, p2, v1, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 150
    .local v0, "a":Landroid/content/res/TypedArray;
    iget v1, p0, Landroid/gesture/GestureOverlayView;->mGestureStrokeWidth:F

    invoke-virtual {v0, v4, v1}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v1

    iput v1, p0, Landroid/gesture/GestureOverlayView;->mGestureStrokeWidth:F

    .line 152
    iget v1, p0, Landroid/gesture/GestureOverlayView;->mGestureStrokeWidth:F

    float-to-int v1, v1

    add-int/lit8 v1, v1, -0x1

    invoke-static {v4, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    iput v1, p0, Landroid/gesture/GestureOverlayView;->mInvalidateExtraBorder:I

    .line 153
    const/4 v1, 0x2

    iget v2, p0, Landroid/gesture/GestureOverlayView;->mCertainGestureColor:I

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    iput v1, p0, Landroid/gesture/GestureOverlayView;->mCertainGestureColor:I

    .line 155
    const/4 v1, 0x3

    iget v2, p0, Landroid/gesture/GestureOverlayView;->mUncertainGestureColor:I

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    iput v1, p0, Landroid/gesture/GestureOverlayView;->mUncertainGestureColor:I

    .line 157
    const/4 v1, 0x5

    iget-wide v2, p0, Landroid/gesture/GestureOverlayView;->mFadeDuration:J

    long-to-int v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    int-to-long v2, v1

    iput-wide v2, p0, Landroid/gesture/GestureOverlayView;->mFadeDuration:J

    .line 158
    const/4 v1, 0x4

    iget-wide v2, p0, Landroid/gesture/GestureOverlayView;->mFadeOffset:J

    long-to-int v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    int-to-long v2, v1

    iput-wide v2, p0, Landroid/gesture/GestureOverlayView;->mFadeOffset:J

    .line 159
    const/4 v1, 0x6

    iget v2, p0, Landroid/gesture/GestureOverlayView;->mGestureStrokeType:I

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    iput v1, p0, Landroid/gesture/GestureOverlayView;->mGestureStrokeType:I

    .line 161
    const/4 v1, 0x7

    iget v2, p0, Landroid/gesture/GestureOverlayView;->mGestureStrokeLengthThreshold:F

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v1

    iput v1, p0, Landroid/gesture/GestureOverlayView;->mGestureStrokeLengthThreshold:F

    .line 164
    const/16 v1, 0x9

    iget v2, p0, Landroid/gesture/GestureOverlayView;->mGestureStrokeAngleThreshold:F

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v1

    iput v1, p0, Landroid/gesture/GestureOverlayView;->mGestureStrokeAngleThreshold:F

    .line 167
    const/16 v1, 0x8

    iget v2, p0, Landroid/gesture/GestureOverlayView;->mGestureStrokeSquarenessTreshold:F

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v1

    iput v1, p0, Landroid/gesture/GestureOverlayView;->mGestureStrokeSquarenessTreshold:F

    .line 170
    iget-boolean v1, p0, Landroid/gesture/GestureOverlayView;->mInterceptEvents:Z

    invoke-virtual {v0, v6, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    iput-boolean v1, p0, Landroid/gesture/GestureOverlayView;->mInterceptEvents:Z

    .line 172
    const/16 v1, 0xb

    iget-boolean v2, p0, Landroid/gesture/GestureOverlayView;->mFadeEnabled:Z

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    iput-boolean v1, p0, Landroid/gesture/GestureOverlayView;->mFadeEnabled:Z

    .line 174
    iget v1, p0, Landroid/gesture/GestureOverlayView;->mOrientation:I

    invoke-virtual {v0, v5, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    iput v1, p0, Landroid/gesture/GestureOverlayView;->mOrientation:I

    .line 176
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 178
    invoke-direct {p0}, Landroid/gesture/GestureOverlayView;->init()V

    .line 179
    return-void
.end method

.method static synthetic access$100(Landroid/gesture/GestureOverlayView;)Z
    .locals 1
    .param p0, "x0"    # Landroid/gesture/GestureOverlayView;

    .prologue
    .line 55
    iget-boolean v0, p0, Landroid/gesture/GestureOverlayView;->mIsFadingOut:Z

    return v0
.end method

.method static synthetic access$1000(Landroid/gesture/GestureOverlayView;)F
    .locals 1
    .param p0, "x0"    # Landroid/gesture/GestureOverlayView;

    .prologue
    .line 55
    iget v0, p0, Landroid/gesture/GestureOverlayView;->mFadingAlpha:F

    return v0
.end method

.method static synthetic access$1002(Landroid/gesture/GestureOverlayView;F)F
    .locals 0
    .param p0, "x0"    # Landroid/gesture/GestureOverlayView;
    .param p1, "x1"    # F

    .prologue
    .line 55
    iput p1, p0, Landroid/gesture/GestureOverlayView;->mFadingAlpha:F

    return p1
.end method

.method static synthetic access$102(Landroid/gesture/GestureOverlayView;Z)Z
    .locals 0
    .param p0, "x0"    # Landroid/gesture/GestureOverlayView;
    .param p1, "x1"    # Z

    .prologue
    .line 55
    iput-boolean p1, p0, Landroid/gesture/GestureOverlayView;->mIsFadingOut:Z

    return p1
.end method

.method static synthetic access$1100(Landroid/gesture/GestureOverlayView;)Landroid/view/animation/AccelerateDecelerateInterpolator;
    .locals 1
    .param p0, "x0"    # Landroid/gesture/GestureOverlayView;

    .prologue
    .line 55
    iget-object v0, p0, Landroid/gesture/GestureOverlayView;->mInterpolator:Landroid/view/animation/AccelerateDecelerateInterpolator;

    return-object v0
.end method

.method static synthetic access$1202(Landroid/gesture/GestureOverlayView;Z)Z
    .locals 0
    .param p0, "x0"    # Landroid/gesture/GestureOverlayView;
    .param p1, "x1"    # Z

    .prologue
    .line 55
    iput-boolean p1, p0, Landroid/gesture/GestureOverlayView;->mResetGesture:Z

    return p1
.end method

.method static synthetic access$200(Landroid/gesture/GestureOverlayView;)J
    .locals 2
    .param p0, "x0"    # Landroid/gesture/GestureOverlayView;

    .prologue
    .line 55
    iget-wide v0, p0, Landroid/gesture/GestureOverlayView;->mFadingStart:J

    return-wide v0
.end method

.method static synthetic access$300(Landroid/gesture/GestureOverlayView;)J
    .locals 2
    .param p0, "x0"    # Landroid/gesture/GestureOverlayView;

    .prologue
    .line 55
    iget-wide v0, p0, Landroid/gesture/GestureOverlayView;->mFadeDuration:J

    return-wide v0
.end method

.method static synthetic access$400(Landroid/gesture/GestureOverlayView;)V
    .locals 0
    .param p0, "x0"    # Landroid/gesture/GestureOverlayView;

    .prologue
    .line 55
    invoke-direct {p0}, Landroid/gesture/GestureOverlayView;->fireOnGesturePerformed()V

    return-void
.end method

.method static synthetic access$502(Landroid/gesture/GestureOverlayView;Z)Z
    .locals 0
    .param p0, "x0"    # Landroid/gesture/GestureOverlayView;
    .param p1, "x1"    # Z

    .prologue
    .line 55
    iput-boolean p1, p0, Landroid/gesture/GestureOverlayView;->mPreviousWasGesturing:Z

    return p1
.end method

.method static synthetic access$602(Landroid/gesture/GestureOverlayView;Z)Z
    .locals 0
    .param p0, "x0"    # Landroid/gesture/GestureOverlayView;
    .param p1, "x1"    # Z

    .prologue
    .line 55
    iput-boolean p1, p0, Landroid/gesture/GestureOverlayView;->mFadingHasStarted:Z

    return p1
.end method

.method static synthetic access$700(Landroid/gesture/GestureOverlayView;)Landroid/graphics/Path;
    .locals 1
    .param p0, "x0"    # Landroid/gesture/GestureOverlayView;

    .prologue
    .line 55
    iget-object v0, p0, Landroid/gesture/GestureOverlayView;->mPath:Landroid/graphics/Path;

    return-object v0
.end method

.method static synthetic access$802(Landroid/gesture/GestureOverlayView;Landroid/gesture/Gesture;)Landroid/gesture/Gesture;
    .locals 0
    .param p0, "x0"    # Landroid/gesture/GestureOverlayView;
    .param p1, "x1"    # Landroid/gesture/Gesture;

    .prologue
    .line 55
    iput-object p1, p0, Landroid/gesture/GestureOverlayView;->mCurrentGesture:Landroid/gesture/Gesture;

    return-object p1
.end method

.method static synthetic access$900(Landroid/gesture/GestureOverlayView;I)V
    .locals 0
    .param p0, "x0"    # Landroid/gesture/GestureOverlayView;
    .param p1, "x1"    # I

    .prologue
    .line 55
    invoke-direct {p0, p1}, Landroid/gesture/GestureOverlayView;->setPaintAlpha(I)V

    return-void
.end method

.method private cancelGesture(Landroid/view/MotionEvent;)V
    .locals 4
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 723
    iget-object v2, p0, Landroid/gesture/GestureOverlayView;->mOnGestureListeners:Ljava/util/ArrayList;

    .line 724
    .local v2, "listeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/gesture/GestureOverlayView$OnGestureListener;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 725
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 726
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/gesture/GestureOverlayView$OnGestureListener;

    invoke-interface {v3, p0, p1}, Landroid/gesture/GestureOverlayView$OnGestureListener;->onGestureCancelled(Landroid/gesture/GestureOverlayView;Landroid/view/MotionEvent;)V

    .line 725
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 729
    :cond_0
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Landroid/gesture/GestureOverlayView;->clear(Z)V

    .line 730
    return-void
.end method

.method private clear(ZZZ)V
    .locals 5
    .param p1, "animated"    # Z
    .param p2, "fireActionPerformed"    # Z
    .param p3, "immediate"    # Z

    .prologue
    const/4 v4, 0x0

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 419
    const/16 v0, 0xff

    invoke-direct {p0, v0}, Landroid/gesture/GestureOverlayView;->setPaintAlpha(I)V

    .line 420
    iget-object v0, p0, Landroid/gesture/GestureOverlayView;->mFadingOut:Landroid/gesture/GestureOverlayView$FadeOutRunnable;

    invoke-virtual {p0, v0}, Landroid/gesture/GestureOverlayView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 421
    iput-boolean v1, p0, Landroid/gesture/GestureOverlayView;->mResetGesture:Z

    .line 422
    iget-object v0, p0, Landroid/gesture/GestureOverlayView;->mFadingOut:Landroid/gesture/GestureOverlayView$FadeOutRunnable;

    iput-boolean p2, v0, Landroid/gesture/GestureOverlayView$FadeOutRunnable;->fireActionPerformed:Z

    .line 423
    iget-object v0, p0, Landroid/gesture/GestureOverlayView;->mFadingOut:Landroid/gesture/GestureOverlayView$FadeOutRunnable;

    iput-boolean v1, v0, Landroid/gesture/GestureOverlayView$FadeOutRunnable;->resetMultipleStrokes:Z

    .line 425
    if-eqz p1, :cond_0

    iget-object v0, p0, Landroid/gesture/GestureOverlayView;->mCurrentGesture:Landroid/gesture/Gesture;

    if-eqz v0, :cond_0

    .line 426
    iput v3, p0, Landroid/gesture/GestureOverlayView;->mFadingAlpha:F

    .line 427
    iput-boolean v2, p0, Landroid/gesture/GestureOverlayView;->mIsFadingOut:Z

    .line 428
    iput-boolean v1, p0, Landroid/gesture/GestureOverlayView;->mFadingHasStarted:Z

    .line 429
    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Landroid/gesture/GestureOverlayView;->mFadeOffset:J

    add-long/2addr v0, v2

    iput-wide v0, p0, Landroid/gesture/GestureOverlayView;->mFadingStart:J

    .line 431
    iget-object v0, p0, Landroid/gesture/GestureOverlayView;->mFadingOut:Landroid/gesture/GestureOverlayView$FadeOutRunnable;

    iget-wide v2, p0, Landroid/gesture/GestureOverlayView;->mFadeOffset:J

    invoke-virtual {p0, v0, v2, v3}, Landroid/gesture/GestureOverlayView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 452
    :goto_0
    return-void

    .line 433
    :cond_0
    iput v3, p0, Landroid/gesture/GestureOverlayView;->mFadingAlpha:F

    .line 434
    iput-boolean v1, p0, Landroid/gesture/GestureOverlayView;->mIsFadingOut:Z

    .line 435
    iput-boolean v1, p0, Landroid/gesture/GestureOverlayView;->mFadingHasStarted:Z

    .line 437
    if-eqz p3, :cond_1

    .line 438
    iput-object v4, p0, Landroid/gesture/GestureOverlayView;->mCurrentGesture:Landroid/gesture/Gesture;

    .line 439
    iget-object v0, p0, Landroid/gesture/GestureOverlayView;->mPath:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->rewind()V

    .line 440
    invoke-virtual {p0}, Landroid/gesture/GestureOverlayView;->invalidate()V

    goto :goto_0

    .line 441
    :cond_1
    if-eqz p2, :cond_2

    .line 442
    iget-object v0, p0, Landroid/gesture/GestureOverlayView;->mFadingOut:Landroid/gesture/GestureOverlayView$FadeOutRunnable;

    iget-wide v2, p0, Landroid/gesture/GestureOverlayView;->mFadeOffset:J

    invoke-virtual {p0, v0, v2, v3}, Landroid/gesture/GestureOverlayView;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0

    .line 443
    :cond_2
    iget v0, p0, Landroid/gesture/GestureOverlayView;->mGestureStrokeType:I

    if-ne v0, v2, :cond_3

    .line 444
    iget-object v0, p0, Landroid/gesture/GestureOverlayView;->mFadingOut:Landroid/gesture/GestureOverlayView$FadeOutRunnable;

    iput-boolean v2, v0, Landroid/gesture/GestureOverlayView$FadeOutRunnable;->resetMultipleStrokes:Z

    .line 445
    iget-object v0, p0, Landroid/gesture/GestureOverlayView;->mFadingOut:Landroid/gesture/GestureOverlayView$FadeOutRunnable;

    iget-wide v2, p0, Landroid/gesture/GestureOverlayView;->mFadeOffset:J

    invoke-virtual {p0, v0, v2, v3}, Landroid/gesture/GestureOverlayView;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0

    .line 447
    :cond_3
    iput-object v4, p0, Landroid/gesture/GestureOverlayView;->mCurrentGesture:Landroid/gesture/Gesture;

    .line 448
    iget-object v0, p0, Landroid/gesture/GestureOverlayView;->mPath:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->rewind()V

    .line 449
    invoke-virtual {p0}, Landroid/gesture/GestureOverlayView;->invalidate()V

    goto :goto_0
.end method

.method private fireOnGesturePerformed()V
    .locals 5

    .prologue
    .line 733
    iget-object v0, p0, Landroid/gesture/GestureOverlayView;->mOnGesturePerformedListeners:Ljava/util/ArrayList;

    .line 734
    .local v0, "actionListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/gesture/GestureOverlayView$OnGesturePerformedListener;>;"
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 735
    .local v1, "count":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 736
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/gesture/GestureOverlayView$OnGesturePerformedListener;

    iget-object v4, p0, Landroid/gesture/GestureOverlayView;->mCurrentGesture:Landroid/gesture/Gesture;

    invoke-interface {v3, p0, v4}, Landroid/gesture/GestureOverlayView$OnGesturePerformedListener;->onGesturePerformed(Landroid/gesture/GestureOverlayView;Landroid/gesture/Gesture;)V

    .line 735
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 738
    :cond_0
    return-void
.end method

.method private init()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 182
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroid/gesture/GestureOverlayView;->setWillNotDraw(Z)V

    .line 184
    iget-object v0, p0, Landroid/gesture/GestureOverlayView;->mGesturePaint:Landroid/graphics/Paint;

    .line 185
    .local v0, "gesturePaint":Landroid/graphics/Paint;
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 186
    iget v1, p0, Landroid/gesture/GestureOverlayView;->mCertainGestureColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 187
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 188
    sget-object v1, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 189
    sget-object v1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 190
    iget v1, p0, Landroid/gesture/GestureOverlayView;->mGestureStrokeWidth:F

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 191
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setDither(Z)V

    .line 193
    iget v1, p0, Landroid/gesture/GestureOverlayView;->mCertainGestureColor:I

    iput v1, p0, Landroid/gesture/GestureOverlayView;->mCurrentColor:I

    .line 194
    const/16 v1, 0xff

    invoke-direct {p0, v1}, Landroid/gesture/GestureOverlayView;->setPaintAlpha(I)V

    .line 195
    return-void
.end method

.method private processEvent(Landroid/view/MotionEvent;)Z
    .locals 4
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 522
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v3

    packed-switch v3, :pswitch_data_0

    :cond_0
    move v1, v2

    .line 551
    :cond_1
    :goto_0
    return v1

    .line 524
    :pswitch_0
    invoke-direct {p0, p1}, Landroid/gesture/GestureOverlayView;->touchDown(Landroid/view/MotionEvent;)V

    .line 525
    invoke-virtual {p0}, Landroid/gesture/GestureOverlayView;->invalidate()V

    goto :goto_0

    .line 528
    :pswitch_1
    iget-boolean v3, p0, Landroid/gesture/GestureOverlayView;->mIsListeningForGestures:Z

    if-eqz v3, :cond_0

    .line 529
    invoke-direct {p0, p1}, Landroid/gesture/GestureOverlayView;->touchMove(Landroid/view/MotionEvent;)Landroid/graphics/Rect;

    move-result-object v0

    .line 530
    .local v0, "rect":Landroid/graphics/Rect;
    if-eqz v0, :cond_1

    .line 531
    invoke-virtual {p0, v0}, Landroid/gesture/GestureOverlayView;->invalidate(Landroid/graphics/Rect;)V

    goto :goto_0

    .line 537
    .end local v0    # "rect":Landroid/graphics/Rect;
    :pswitch_2
    iget-boolean v3, p0, Landroid/gesture/GestureOverlayView;->mIsListeningForGestures:Z

    if-eqz v3, :cond_0

    .line 538
    invoke-direct {p0, p1, v2}, Landroid/gesture/GestureOverlayView;->touchUp(Landroid/view/MotionEvent;Z)V

    .line 539
    invoke-virtual {p0}, Landroid/gesture/GestureOverlayView;->invalidate()V

    goto :goto_0

    .line 544
    :pswitch_3
    iget-boolean v3, p0, Landroid/gesture/GestureOverlayView;->mIsListeningForGestures:Z

    if-eqz v3, :cond_0

    .line 545
    invoke-direct {p0, p1, v1}, Landroid/gesture/GestureOverlayView;->touchUp(Landroid/view/MotionEvent;Z)V

    .line 546
    invoke-virtual {p0}, Landroid/gesture/GestureOverlayView;->invalidate()V

    goto :goto_0

    .line 522
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_2
        :pswitch_1
        :pswitch_3
    .end packed-switch
.end method

.method private setCurrentColor(I)V
    .locals 2
    .param p1, "color"    # I

    .prologue
    .line 382
    iput p1, p0, Landroid/gesture/GestureOverlayView;->mCurrentColor:I

    .line 383
    iget-boolean v0, p0, Landroid/gesture/GestureOverlayView;->mFadingHasStarted:Z

    if-eqz v0, :cond_0

    .line 384
    const/high16 v0, 0x437f0000    # 255.0f

    iget v1, p0, Landroid/gesture/GestureOverlayView;->mFadingAlpha:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    invoke-direct {p0, v0}, Landroid/gesture/GestureOverlayView;->setPaintAlpha(I)V

    .line 388
    :goto_0
    invoke-virtual {p0}, Landroid/gesture/GestureOverlayView;->invalidate()V

    .line 389
    return-void

    .line 386
    :cond_0
    const/16 v0, 0xff

    invoke-direct {p0, v0}, Landroid/gesture/GestureOverlayView;->setPaintAlpha(I)V

    goto :goto_0
.end method

.method private setPaintAlpha(I)V
    .locals 5
    .param p1, "alpha"    # I

    .prologue
    .line 408
    shr-int/lit8 v2, p1, 0x7

    add-int/2addr p1, v2

    .line 409
    iget v2, p0, Landroid/gesture/GestureOverlayView;->mCurrentColor:I

    ushr-int/lit8 v0, v2, 0x18

    .line 410
    .local v0, "baseAlpha":I
    mul-int v2, v0, p1

    shr-int/lit8 v1, v2, 0x8

    .line 411
    .local v1, "useAlpha":I
    iget-object v2, p0, Landroid/gesture/GestureOverlayView;->mGesturePaint:Landroid/graphics/Paint;

    iget v3, p0, Landroid/gesture/GestureOverlayView;->mCurrentColor:I

    shl-int/lit8 v3, v3, 0x8

    ushr-int/lit8 v3, v3, 0x8

    shl-int/lit8 v4, v1, 0x18

    or-int/2addr v3, v4

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 412
    return-void
.end method

.method private touchDown(Landroid/view/MotionEvent;)V
    .locals 11
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v7, 0x0

    .line 555
    const/4 v6, 0x1

    iput-boolean v6, p0, Landroid/gesture/GestureOverlayView;->mIsListeningForGestures:Z

    .line 557
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    .line 558
    .local v4, "x":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    .line 560
    .local v5, "y":F
    iput v4, p0, Landroid/gesture/GestureOverlayView;->mX:F

    .line 561
    iput v5, p0, Landroid/gesture/GestureOverlayView;->mY:F

    .line 563
    const/4 v6, 0x0

    iput v6, p0, Landroid/gesture/GestureOverlayView;->mTotalLength:F

    .line 564
    iput-boolean v7, p0, Landroid/gesture/GestureOverlayView;->mIsGesturing:Z

    .line 566
    iget v6, p0, Landroid/gesture/GestureOverlayView;->mGestureStrokeType:I

    if-eqz v6, :cond_0

    iget-boolean v6, p0, Landroid/gesture/GestureOverlayView;->mResetGesture:Z

    if-eqz v6, :cond_5

    .line 567
    :cond_0
    iget-boolean v6, p0, Landroid/gesture/GestureOverlayView;->mHandleGestureActions:Z

    if-eqz v6, :cond_1

    iget v6, p0, Landroid/gesture/GestureOverlayView;->mUncertainGestureColor:I

    invoke-direct {p0, v6}, Landroid/gesture/GestureOverlayView;->setCurrentColor(I)V

    .line 568
    :cond_1
    iput-boolean v7, p0, Landroid/gesture/GestureOverlayView;->mResetGesture:Z

    .line 569
    const/4 v6, 0x0

    iput-object v6, p0, Landroid/gesture/GestureOverlayView;->mCurrentGesture:Landroid/gesture/Gesture;

    .line 570
    iget-object v6, p0, Landroid/gesture/GestureOverlayView;->mPath:Landroid/graphics/Path;

    invoke-virtual {v6}, Landroid/graphics/Path;->rewind()V

    .line 576
    :cond_2
    :goto_0
    iget-boolean v6, p0, Landroid/gesture/GestureOverlayView;->mFadingHasStarted:Z

    if-eqz v6, :cond_7

    .line 577
    invoke-virtual {p0}, Landroid/gesture/GestureOverlayView;->cancelClearAnimation()V

    .line 585
    :cond_3
    :goto_1
    iget-object v6, p0, Landroid/gesture/GestureOverlayView;->mCurrentGesture:Landroid/gesture/Gesture;

    if-nez v6, :cond_4

    .line 586
    new-instance v6, Landroid/gesture/Gesture;

    invoke-direct {v6}, Landroid/gesture/Gesture;-><init>()V

    iput-object v6, p0, Landroid/gesture/GestureOverlayView;->mCurrentGesture:Landroid/gesture/Gesture;

    .line 589
    :cond_4
    iget-object v6, p0, Landroid/gesture/GestureOverlayView;->mStrokeBuffer:Ljava/util/ArrayList;

    new-instance v7, Landroid/gesture/GesturePoint;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v8

    invoke-direct {v7, v4, v5, v8, v9}, Landroid/gesture/GesturePoint;-><init>(FFJ)V

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 590
    iget-object v6, p0, Landroid/gesture/GestureOverlayView;->mPath:Landroid/graphics/Path;

    invoke-virtual {v6, v4, v5}, Landroid/graphics/Path;->moveTo(FF)V

    .line 592
    iget v0, p0, Landroid/gesture/GestureOverlayView;->mInvalidateExtraBorder:I

    .line 593
    .local v0, "border":I
    iget-object v6, p0, Landroid/gesture/GestureOverlayView;->mInvalidRect:Landroid/graphics/Rect;

    float-to-int v7, v4

    sub-int/2addr v7, v0

    float-to-int v8, v5

    sub-int/2addr v8, v0

    float-to-int v9, v4

    add-int/2addr v9, v0

    float-to-int v10, v5

    add-int/2addr v10, v0

    invoke-virtual {v6, v7, v8, v9, v10}, Landroid/graphics/Rect;->set(IIII)V

    .line 595
    iput v4, p0, Landroid/gesture/GestureOverlayView;->mCurveEndX:F

    .line 596
    iput v5, p0, Landroid/gesture/GestureOverlayView;->mCurveEndY:F

    .line 599
    iget-object v3, p0, Landroid/gesture/GestureOverlayView;->mOnGestureListeners:Ljava/util/ArrayList;

    .line 600
    .local v3, "listeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/gesture/GestureOverlayView$OnGestureListener;>;"
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 601
    .local v1, "count":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2
    if-ge v2, v1, :cond_8

    .line 602
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/gesture/GestureOverlayView$OnGestureListener;

    invoke-interface {v6, p0, p1}, Landroid/gesture/GestureOverlayView$OnGestureListener;->onGestureStarted(Landroid/gesture/GestureOverlayView;Landroid/view/MotionEvent;)V

    .line 601
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 571
    .end local v0    # "border":I
    .end local v1    # "count":I
    .end local v2    # "i":I
    .end local v3    # "listeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/gesture/GestureOverlayView$OnGestureListener;>;"
    :cond_5
    iget-object v6, p0, Landroid/gesture/GestureOverlayView;->mCurrentGesture:Landroid/gesture/Gesture;

    if-eqz v6, :cond_6

    iget-object v6, p0, Landroid/gesture/GestureOverlayView;->mCurrentGesture:Landroid/gesture/Gesture;

    invoke-virtual {v6}, Landroid/gesture/Gesture;->getStrokesCount()I

    move-result v6

    if-nez v6, :cond_2

    .line 572
    :cond_6
    iget-boolean v6, p0, Landroid/gesture/GestureOverlayView;->mHandleGestureActions:Z

    if-eqz v6, :cond_2

    iget v6, p0, Landroid/gesture/GestureOverlayView;->mUncertainGestureColor:I

    invoke-direct {p0, v6}, Landroid/gesture/GestureOverlayView;->setCurrentColor(I)V

    goto :goto_0

    .line 578
    :cond_7
    iget-boolean v6, p0, Landroid/gesture/GestureOverlayView;->mIsFadingOut:Z

    if-eqz v6, :cond_3

    .line 579
    const/16 v6, 0xff

    invoke-direct {p0, v6}, Landroid/gesture/GestureOverlayView;->setPaintAlpha(I)V

    .line 580
    iput-boolean v7, p0, Landroid/gesture/GestureOverlayView;->mIsFadingOut:Z

    .line 581
    iput-boolean v7, p0, Landroid/gesture/GestureOverlayView;->mFadingHasStarted:Z

    .line 582
    iget-object v6, p0, Landroid/gesture/GestureOverlayView;->mFadingOut:Landroid/gesture/GestureOverlayView$FadeOutRunnable;

    invoke-virtual {p0, v6}, Landroid/gesture/GestureOverlayView;->removeCallbacks(Ljava/lang/Runnable;)Z

    goto :goto_1

    .line 604
    .restart local v0    # "border":I
    .restart local v1    # "count":I
    .restart local v2    # "i":I
    .restart local v3    # "listeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/gesture/GestureOverlayView$OnGestureListener;>;"
    :cond_8
    return-void
.end method

.method private touchMove(Landroid/view/MotionEvent;)Landroid/graphics/Rect;
    .locals 26
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 607
    const/4 v7, 0x0

    .line 609
    .local v7, "areaToRefresh":Landroid/graphics/Rect;
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v20

    .line 610
    .local v20, "x":F
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v21

    .line 612
    .local v21, "y":F
    move-object/from16 v0, p0

    iget v0, v0, Landroid/gesture/GestureOverlayView;->mX:F

    move/from16 v18, v0

    .line 613
    .local v18, "previousX":F
    move-object/from16 v0, p0

    iget v0, v0, Landroid/gesture/GestureOverlayView;->mY:F

    move/from16 v19, v0

    .line 615
    .local v19, "previousY":F
    sub-float v22, v20, v18

    invoke-static/range {v22 .. v22}, Ljava/lang/Math;->abs(F)F

    move-result v13

    .line 616
    .local v13, "dx":F
    sub-float v22, v21, v19

    invoke-static/range {v22 .. v22}, Ljava/lang/Math;->abs(F)F

    move-result v14

    .line 618
    .local v14, "dy":F
    const/high16 v22, 0x40400000    # 3.0f

    cmpl-float v22, v13, v22

    if-gez v22, :cond_0

    const/high16 v22, 0x40400000    # 3.0f

    cmpl-float v22, v14, v22

    if-ltz v22, :cond_5

    .line 619
    :cond_0
    move-object/from16 v0, p0

    iget-object v7, v0, Landroid/gesture/GestureOverlayView;->mInvalidRect:Landroid/graphics/Rect;

    .line 622
    move-object/from16 v0, p0

    iget v8, v0, Landroid/gesture/GestureOverlayView;->mInvalidateExtraBorder:I

    .line 623
    .local v8, "border":I
    move-object/from16 v0, p0

    iget v0, v0, Landroid/gesture/GestureOverlayView;->mCurveEndX:F

    move/from16 v22, v0

    move/from16 v0, v22

    float-to-int v0, v0

    move/from16 v22, v0

    sub-int v22, v22, v8

    move-object/from16 v0, p0

    iget v0, v0, Landroid/gesture/GestureOverlayView;->mCurveEndY:F

    move/from16 v23, v0

    move/from16 v0, v23

    float-to-int v0, v0

    move/from16 v23, v0

    sub-int v23, v23, v8

    move-object/from16 v0, p0

    iget v0, v0, Landroid/gesture/GestureOverlayView;->mCurveEndX:F

    move/from16 v24, v0

    move/from16 v0, v24

    float-to-int v0, v0

    move/from16 v24, v0

    add-int v24, v24, v8

    move-object/from16 v0, p0

    iget v0, v0, Landroid/gesture/GestureOverlayView;->mCurveEndY:F

    move/from16 v25, v0

    move/from16 v0, v25

    float-to-int v0, v0

    move/from16 v25, v0

    add-int v25, v25, v8

    move/from16 v0, v22

    move/from16 v1, v23

    move/from16 v2, v24

    move/from16 v3, v25

    invoke-virtual {v7, v0, v1, v2, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 626
    add-float v22, v20, v18

    const/high16 v23, 0x40000000    # 2.0f

    div-float v10, v22, v23

    move-object/from16 v0, p0

    iput v10, v0, Landroid/gesture/GestureOverlayView;->mCurveEndX:F

    .line 627
    .local v10, "cX":F
    add-float v22, v21, v19

    const/high16 v23, 0x40000000    # 2.0f

    div-float v11, v22, v23

    move-object/from16 v0, p0

    iput v11, v0, Landroid/gesture/GestureOverlayView;->mCurveEndY:F

    .line 629
    .local v11, "cY":F
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/gesture/GestureOverlayView;->mPath:Landroid/graphics/Path;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move/from16 v1, v18

    move/from16 v2, v19

    invoke-virtual {v0, v1, v2, v10, v11}, Landroid/graphics/Path;->quadTo(FFFF)V

    .line 632
    move/from16 v0, v18

    float-to-int v0, v0

    move/from16 v22, v0

    sub-int v22, v22, v8

    move/from16 v0, v19

    float-to-int v0, v0

    move/from16 v23, v0

    sub-int v23, v23, v8

    move/from16 v0, v18

    float-to-int v0, v0

    move/from16 v24, v0

    add-int v24, v24, v8

    move/from16 v0, v19

    float-to-int v0, v0

    move/from16 v25, v0

    add-int v25, v25, v8

    move/from16 v0, v22

    move/from16 v1, v23

    move/from16 v2, v24

    move/from16 v3, v25

    invoke-virtual {v7, v0, v1, v2, v3}, Landroid/graphics/Rect;->union(IIII)V

    .line 636
    float-to-int v0, v10

    move/from16 v22, v0

    sub-int v22, v22, v8

    float-to-int v0, v11

    move/from16 v23, v0

    sub-int v23, v23, v8

    float-to-int v0, v10

    move/from16 v24, v0

    add-int v24, v24, v8

    float-to-int v0, v11

    move/from16 v25, v0

    add-int v25, v25, v8

    move/from16 v0, v22

    move/from16 v1, v23

    move/from16 v2, v24

    move/from16 v3, v25

    invoke-virtual {v7, v0, v1, v2, v3}, Landroid/graphics/Rect;->union(IIII)V

    .line 639
    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Landroid/gesture/GestureOverlayView;->mX:F

    .line 640
    move/from16 v0, v21

    move-object/from16 v1, p0

    iput v0, v1, Landroid/gesture/GestureOverlayView;->mY:F

    .line 642
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/gesture/GestureOverlayView;->mStrokeBuffer:Ljava/util/ArrayList;

    move-object/from16 v22, v0

    new-instance v23, Landroid/gesture/GesturePoint;

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v24

    move-object/from16 v0, v23

    move/from16 v1, v20

    move/from16 v2, v21

    move-wide/from16 v3, v24

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/gesture/GesturePoint;-><init>(FFJ)V

    invoke-virtual/range {v22 .. v23}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 644
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/gesture/GestureOverlayView;->mHandleGestureActions:Z

    move/from16 v22, v0

    if-eqz v22, :cond_4

    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/gesture/GestureOverlayView;->mIsGesturing:Z

    move/from16 v22, v0

    if-nez v22, :cond_4

    .line 645
    move-object/from16 v0, p0

    iget v0, v0, Landroid/gesture/GestureOverlayView;->mTotalLength:F

    move/from16 v22, v0

    mul-float v23, v13, v13

    mul-float v24, v14, v14

    add-float v23, v23, v24

    move/from16 v0, v23

    float-to-double v0, v0

    move-wide/from16 v24, v0

    invoke-static/range {v24 .. v25}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v24

    move-wide/from16 v0, v24

    double-to-float v0, v0

    move/from16 v23, v0

    add-float v22, v22, v23

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Landroid/gesture/GestureOverlayView;->mTotalLength:F

    .line 647
    move-object/from16 v0, p0

    iget v0, v0, Landroid/gesture/GestureOverlayView;->mTotalLength:F

    move/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Landroid/gesture/GestureOverlayView;->mGestureStrokeLengthThreshold:F

    move/from16 v23, v0

    cmpl-float v22, v22, v23

    if-lez v22, :cond_4

    .line 648
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/gesture/GestureOverlayView;->mStrokeBuffer:Ljava/util/ArrayList;

    move-object/from16 v22, v0

    invoke-static/range {v22 .. v22}, Landroid/gesture/GestureUtils;->computeOrientedBoundingBox(Ljava/util/ArrayList;)Landroid/gesture/OrientedBoundingBox;

    move-result-object v9

    .line 651
    .local v9, "box":Landroid/gesture/OrientedBoundingBox;
    iget v0, v9, Landroid/gesture/OrientedBoundingBox;->orientation:F

    move/from16 v22, v0

    invoke-static/range {v22 .. v22}, Ljava/lang/Math;->abs(F)F

    move-result v6

    .line 652
    .local v6, "angle":F
    const/high16 v22, 0x42b40000    # 90.0f

    cmpl-float v22, v6, v22

    if-lez v22, :cond_1

    .line 653
    const/high16 v22, 0x43340000    # 180.0f

    sub-float v6, v22, v6

    .line 656
    :cond_1
    iget v0, v9, Landroid/gesture/OrientedBoundingBox;->squareness:F

    move/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Landroid/gesture/GestureOverlayView;->mGestureStrokeSquarenessTreshold:F

    move/from16 v23, v0

    cmpl-float v22, v22, v23

    if-gtz v22, :cond_2

    move-object/from16 v0, p0

    iget v0, v0, Landroid/gesture/GestureOverlayView;->mOrientation:I

    move/from16 v22, v0

    const/16 v23, 0x1

    move/from16 v0, v22

    move/from16 v1, v23

    if-ne v0, v1, :cond_3

    move-object/from16 v0, p0

    iget v0, v0, Landroid/gesture/GestureOverlayView;->mGestureStrokeAngleThreshold:F

    move/from16 v22, v0

    cmpg-float v22, v6, v22

    if-gez v22, :cond_4

    .line 661
    :cond_2
    const/16 v22, 0x1

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput-boolean v0, v1, Landroid/gesture/GestureOverlayView;->mIsGesturing:Z

    .line 662
    move-object/from16 v0, p0

    iget v0, v0, Landroid/gesture/GestureOverlayView;->mCertainGestureColor:I

    move/from16 v22, v0

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Landroid/gesture/GestureOverlayView;->setCurrentColor(I)V

    .line 664
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/gesture/GestureOverlayView;->mOnGesturingListeners:Ljava/util/ArrayList;

    move-object/from16 v17, v0

    .line 665
    .local v17, "listeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/gesture/GestureOverlayView$OnGesturingListener;>;"
    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->size()I

    move-result v12

    .line 666
    .local v12, "count":I
    const/4 v15, 0x0

    .local v15, "i":I
    :goto_0
    if-ge v15, v12, :cond_4

    .line 667
    move-object/from16 v0, v17

    invoke-virtual {v0, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Landroid/gesture/GestureOverlayView$OnGesturingListener;

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    invoke-interface {v0, v1}, Landroid/gesture/GestureOverlayView$OnGesturingListener;->onGesturingStarted(Landroid/gesture/GestureOverlayView;)V

    .line 666
    add-int/lit8 v15, v15, 0x1

    goto :goto_0

    .line 656
    .end local v12    # "count":I
    .end local v15    # "i":I
    .end local v17    # "listeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/gesture/GestureOverlayView$OnGesturingListener;>;"
    :cond_3
    move-object/from16 v0, p0

    iget v0, v0, Landroid/gesture/GestureOverlayView;->mGestureStrokeAngleThreshold:F

    move/from16 v22, v0

    cmpl-float v22, v6, v22

    if-gtz v22, :cond_2

    .line 674
    .end local v6    # "angle":F
    .end local v9    # "box":Landroid/gesture/OrientedBoundingBox;
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/gesture/GestureOverlayView;->mOnGestureListeners:Ljava/util/ArrayList;

    move-object/from16 v16, v0

    .line 675
    .local v16, "listeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/gesture/GestureOverlayView$OnGestureListener;>;"
    invoke-virtual/range {v16 .. v16}, Ljava/util/ArrayList;->size()I

    move-result v12

    .line 676
    .restart local v12    # "count":I
    const/4 v15, 0x0

    .restart local v15    # "i":I
    :goto_1
    if-ge v15, v12, :cond_5

    .line 677
    move-object/from16 v0, v16

    invoke-virtual {v0, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Landroid/gesture/GestureOverlayView$OnGestureListener;

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    invoke-interface {v0, v1, v2}, Landroid/gesture/GestureOverlayView$OnGestureListener;->onGesture(Landroid/gesture/GestureOverlayView;Landroid/view/MotionEvent;)V

    .line 676
    add-int/lit8 v15, v15, 0x1

    goto :goto_1

    .line 681
    .end local v8    # "border":I
    .end local v10    # "cX":F
    .end local v11    # "cY":F
    .end local v12    # "count":I
    .end local v15    # "i":I
    .end local v16    # "listeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/gesture/GestureOverlayView$OnGestureListener;>;"
    :cond_5
    return-object v7
.end method

.method private touchUp(Landroid/view/MotionEvent;Z)V
    .locals 9
    .param p1, "event"    # Landroid/view/MotionEvent;
    .param p2, "cancel"    # Z

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 685
    iput-boolean v6, p0, Landroid/gesture/GestureOverlayView;->mIsListeningForGestures:Z

    .line 688
    iget-object v4, p0, Landroid/gesture/GestureOverlayView;->mCurrentGesture:Landroid/gesture/Gesture;

    if-eqz v4, :cond_4

    .line 690
    iget-object v4, p0, Landroid/gesture/GestureOverlayView;->mCurrentGesture:Landroid/gesture/Gesture;

    new-instance v7, Landroid/gesture/GestureStroke;

    iget-object v8, p0, Landroid/gesture/GestureOverlayView;->mStrokeBuffer:Ljava/util/ArrayList;

    invoke-direct {v7, v8}, Landroid/gesture/GestureStroke;-><init>(Ljava/util/ArrayList;)V

    invoke-virtual {v4, v7}, Landroid/gesture/Gesture;->addStroke(Landroid/gesture/GestureStroke;)V

    .line 692
    if-nez p2, :cond_3

    .line 694
    iget-object v2, p0, Landroid/gesture/GestureOverlayView;->mOnGestureListeners:Ljava/util/ArrayList;

    .line 695
    .local v2, "listeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/gesture/GestureOverlayView$OnGestureListener;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 696
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 697
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/gesture/GestureOverlayView$OnGestureListener;

    invoke-interface {v4, p0, p1}, Landroid/gesture/GestureOverlayView$OnGestureListener;->onGestureEnded(Landroid/gesture/GestureOverlayView;Landroid/view/MotionEvent;)V

    .line 696
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 700
    :cond_0
    iget-boolean v4, p0, Landroid/gesture/GestureOverlayView;->mHandleGestureActions:Z

    if-eqz v4, :cond_1

    iget-boolean v4, p0, Landroid/gesture/GestureOverlayView;->mFadeEnabled:Z

    if-eqz v4, :cond_1

    move v4, v5

    :goto_1
    iget-boolean v7, p0, Landroid/gesture/GestureOverlayView;->mHandleGestureActions:Z

    if-eqz v7, :cond_2

    iget-boolean v7, p0, Landroid/gesture/GestureOverlayView;->mIsGesturing:Z

    if-eqz v7, :cond_2

    :goto_2
    invoke-direct {p0, v4, v5, v6}, Landroid/gesture/GestureOverlayView;->clear(ZZZ)V

    .line 710
    .end local v0    # "count":I
    .end local v1    # "i":I
    .end local v2    # "listeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/gesture/GestureOverlayView$OnGestureListener;>;"
    :goto_3
    iget-object v4, p0, Landroid/gesture/GestureOverlayView;->mStrokeBuffer:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    .line 711
    iget-boolean v4, p0, Landroid/gesture/GestureOverlayView;->mIsGesturing:Z

    iput-boolean v4, p0, Landroid/gesture/GestureOverlayView;->mPreviousWasGesturing:Z

    .line 712
    iput-boolean v6, p0, Landroid/gesture/GestureOverlayView;->mIsGesturing:Z

    .line 714
    iget-object v3, p0, Landroid/gesture/GestureOverlayView;->mOnGesturingListeners:Ljava/util/ArrayList;

    .line 715
    .local v3, "listeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/gesture/GestureOverlayView$OnGesturingListener;>;"
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 716
    .restart local v0    # "count":I
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_4
    if-ge v1, v0, :cond_5

    .line 717
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/gesture/GestureOverlayView$OnGesturingListener;

    invoke-interface {v4, p0}, Landroid/gesture/GestureOverlayView$OnGesturingListener;->onGesturingEnded(Landroid/gesture/GestureOverlayView;)V

    .line 716
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .end local v3    # "listeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/gesture/GestureOverlayView$OnGesturingListener;>;"
    .restart local v2    # "listeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/gesture/GestureOverlayView$OnGestureListener;>;"
    :cond_1
    move v4, v6

    .line 700
    goto :goto_1

    :cond_2
    move v5, v6

    goto :goto_2

    .line 703
    .end local v0    # "count":I
    .end local v1    # "i":I
    .end local v2    # "listeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/gesture/GestureOverlayView$OnGestureListener;>;"
    :cond_3
    invoke-direct {p0, p1}, Landroid/gesture/GestureOverlayView;->cancelGesture(Landroid/view/MotionEvent;)V

    goto :goto_3

    .line 707
    :cond_4
    invoke-direct {p0, p1}, Landroid/gesture/GestureOverlayView;->cancelGesture(Landroid/view/MotionEvent;)V

    goto :goto_3

    .line 719
    .restart local v0    # "count":I
    .restart local v1    # "i":I
    .restart local v3    # "listeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/gesture/GestureOverlayView$OnGesturingListener;>;"
    :cond_5
    return-void
.end method


# virtual methods
.method public addOnGestureListener(Landroid/gesture/GestureOverlayView$OnGestureListener;)V
    .locals 1
    .param p1, "listener"    # Landroid/gesture/GestureOverlayView$OnGestureListener;

    .prologue
    .line 335
    iget-object v0, p0, Landroid/gesture/GestureOverlayView;->mOnGestureListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 336
    return-void
.end method

.method public addOnGesturePerformedListener(Landroid/gesture/GestureOverlayView$OnGesturePerformedListener;)V
    .locals 1
    .param p1, "listener"    # Landroid/gesture/GestureOverlayView$OnGesturePerformedListener;

    .prologue
    .line 347
    iget-object v0, p0, Landroid/gesture/GestureOverlayView;->mOnGesturePerformedListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 348
    iget-object v0, p0, Landroid/gesture/GestureOverlayView;->mOnGesturePerformedListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 349
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/gesture/GestureOverlayView;->mHandleGestureActions:Z

    .line 351
    :cond_0
    return-void
.end method

.method public addOnGesturingListener(Landroid/gesture/GestureOverlayView$OnGesturingListener;)V
    .locals 1
    .param p1, "listener"    # Landroid/gesture/GestureOverlayView$OnGesturingListener;

    .prologue
    .line 366
    iget-object v0, p0, Landroid/gesture/GestureOverlayView;->mOnGesturingListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 367
    return-void
.end method

.method public cancelClearAnimation()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 455
    const/16 v0, 0xff

    invoke-direct {p0, v0}, Landroid/gesture/GestureOverlayView;->setPaintAlpha(I)V

    .line 456
    iput-boolean v1, p0, Landroid/gesture/GestureOverlayView;->mIsFadingOut:Z

    .line 457
    iput-boolean v1, p0, Landroid/gesture/GestureOverlayView;->mFadingHasStarted:Z

    .line 458
    iget-object v0, p0, Landroid/gesture/GestureOverlayView;->mFadingOut:Landroid/gesture/GestureOverlayView$FadeOutRunnable;

    invoke-virtual {p0, v0}, Landroid/gesture/GestureOverlayView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 459
    iget-object v0, p0, Landroid/gesture/GestureOverlayView;->mPath:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->rewind()V

    .line 460
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/gesture/GestureOverlayView;->mCurrentGesture:Landroid/gesture/Gesture;

    .line 461
    return-void
.end method

.method public cancelGesture()V
    .locals 13

    .prologue
    const/4 v5, 0x0

    const/4 v7, 0x0

    .line 464
    iput-boolean v7, p0, Landroid/gesture/GestureOverlayView;->mIsListeningForGestures:Z

    .line 467
    iget-object v2, p0, Landroid/gesture/GestureOverlayView;->mCurrentGesture:Landroid/gesture/Gesture;

    new-instance v3, Landroid/gesture/GestureStroke;

    iget-object v4, p0, Landroid/gesture/GestureOverlayView;->mStrokeBuffer:Ljava/util/ArrayList;

    invoke-direct {v3, v4}, Landroid/gesture/GestureStroke;-><init>(Ljava/util/ArrayList;)V

    invoke-virtual {v2, v3}, Landroid/gesture/Gesture;->addStroke(Landroid/gesture/GestureStroke;)V

    .line 470
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 471
    .local v0, "now":J
    const/4 v4, 0x3

    move-wide v2, v0

    move v6, v5

    invoke-static/range {v0 .. v7}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v9

    .line 474
    .local v9, "event":Landroid/view/MotionEvent;
    iget-object v11, p0, Landroid/gesture/GestureOverlayView;->mOnGestureListeners:Ljava/util/ArrayList;

    .line 475
    .local v11, "listeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/gesture/GestureOverlayView$OnGestureListener;>;"
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v8

    .line 476
    .local v8, "count":I
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_0
    if-ge v10, v8, :cond_0

    .line 477
    invoke-virtual {v11, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gesture/GestureOverlayView$OnGestureListener;

    invoke-interface {v2, p0, v9}, Landroid/gesture/GestureOverlayView$OnGestureListener;->onGestureCancelled(Landroid/gesture/GestureOverlayView;Landroid/view/MotionEvent;)V

    .line 476
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 480
    :cond_0
    invoke-virtual {v9}, Landroid/view/MotionEvent;->recycle()V

    .line 482
    invoke-virtual {p0, v7}, Landroid/gesture/GestureOverlayView;->clear(Z)V

    .line 483
    iput-boolean v7, p0, Landroid/gesture/GestureOverlayView;->mIsGesturing:Z

    .line 484
    iput-boolean v7, p0, Landroid/gesture/GestureOverlayView;->mPreviousWasGesturing:Z

    .line 485
    iget-object v2, p0, Landroid/gesture/GestureOverlayView;->mStrokeBuffer:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 487
    iget-object v12, p0, Landroid/gesture/GestureOverlayView;->mOnGesturingListeners:Ljava/util/ArrayList;

    .line 488
    .local v12, "otherListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/gesture/GestureOverlayView$OnGesturingListener;>;"
    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v8

    .line 489
    const/4 v10, 0x0

    :goto_1
    if-ge v10, v8, :cond_1

    .line 490
    invoke-virtual {v12, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/gesture/GestureOverlayView$OnGesturingListener;

    invoke-interface {v2, p0}, Landroid/gesture/GestureOverlayView$OnGesturingListener;->onGesturingEnded(Landroid/gesture/GestureOverlayView;)V

    .line 489
    add-int/lit8 v10, v10, 0x1

    goto :goto_1

    .line 492
    :cond_1
    return-void
.end method

.method public clear(Z)V
    .locals 2
    .param p1, "animated"    # Z

    .prologue
    .line 415
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Landroid/gesture/GestureOverlayView;->clear(ZZZ)V

    .line 416
    return-void
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v1, 0x1

    .line 502
    invoke-virtual {p0}, Landroid/gesture/GestureOverlayView;->isEnabled()Z

    move-result v2

    if-eqz v2, :cond_3

    iget-boolean v2, p0, Landroid/gesture/GestureOverlayView;->mInputEnabled:Z

    if-eqz v2, :cond_3

    .line 503
    iget-boolean v2, p0, Landroid/gesture/GestureOverlayView;->mIsGesturing:Z

    if-nez v2, :cond_0

    iget-object v2, p0, Landroid/gesture/GestureOverlayView;->mCurrentGesture:Landroid/gesture/Gesture;

    if-eqz v2, :cond_2

    iget-object v2, p0, Landroid/gesture/GestureOverlayView;->mCurrentGesture:Landroid/gesture/Gesture;

    invoke-virtual {v2}, Landroid/gesture/Gesture;->getStrokesCount()I

    move-result v2

    if-lez v2, :cond_2

    iget-boolean v2, p0, Landroid/gesture/GestureOverlayView;->mPreviousWasGesturing:Z

    if-eqz v2, :cond_2

    :cond_0
    iget-boolean v2, p0, Landroid/gesture/GestureOverlayView;->mInterceptEvents:Z

    if-eqz v2, :cond_2

    move v0, v1

    .line 507
    .local v0, "cancelDispatch":Z
    :goto_0
    invoke-direct {p0, p1}, Landroid/gesture/GestureOverlayView;->processEvent(Landroid/view/MotionEvent;)Z

    .line 509
    if-eqz v0, :cond_1

    .line 510
    const/4 v2, 0x3

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->setAction(I)V

    .line 513
    :cond_1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 518
    .end local v0    # "cancelDispatch":Z
    :goto_1
    return v1

    .line 503
    :cond_2
    const/4 v0, 0x0

    goto :goto_0

    .line 518
    :cond_3
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v1

    goto :goto_1
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 2
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 400
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->draw(Landroid/graphics/Canvas;)V

    .line 402
    iget-object v0, p0, Landroid/gesture/GestureOverlayView;->mCurrentGesture:Landroid/gesture/Gesture;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Landroid/gesture/GestureOverlayView;->mGestureVisible:Z

    if-eqz v0, :cond_0

    .line 403
    iget-object v0, p0, Landroid/gesture/GestureOverlayView;->mPath:Landroid/graphics/Path;

    iget-object v1, p0, Landroid/gesture/GestureOverlayView;->mGesturePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 405
    :cond_0
    return-void
.end method

.method public getCurrentStroke()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/gesture/GesturePoint;",
            ">;"
        }
    .end annotation

    .prologue
    .line 198
    iget-object v0, p0, Landroid/gesture/GestureOverlayView;->mStrokeBuffer:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getFadeOffset()J
    .locals 2

    .prologue
    .line 327
    iget-wide v0, p0, Landroid/gesture/GestureOverlayView;->mFadeOffset:J

    return-wide v0
.end method

.method public getGesture()Landroid/gesture/Gesture;
    .locals 1

    .prologue
    .line 284
    iget-object v0, p0, Landroid/gesture/GestureOverlayView;->mCurrentGesture:Landroid/gesture/Gesture;

    return-object v0
.end method

.method public getGestureColor()I
    .locals 1

    .prologue
    .line 222
    iget v0, p0, Landroid/gesture/GestureOverlayView;->mCertainGestureColor:I

    return v0
.end method

.method public getGesturePaint()Landroid/graphics/Paint;
    .locals 1

    .prologue
    .line 395
    iget-object v0, p0, Landroid/gesture/GestureOverlayView;->mGesturePaint:Landroid/graphics/Paint;

    return-object v0
.end method

.method public getGesturePath()Landroid/graphics/Path;
    .locals 1

    .prologue
    .line 310
    iget-object v0, p0, Landroid/gesture/GestureOverlayView;->mPath:Landroid/graphics/Path;

    return-object v0
.end method

.method public getGesturePath(Landroid/graphics/Path;)Landroid/graphics/Path;
    .locals 1
    .param p1, "path"    # Landroid/graphics/Path;

    .prologue
    .line 314
    iget-object v0, p0, Landroid/gesture/GestureOverlayView;->mPath:Landroid/graphics/Path;

    invoke-virtual {p1, v0}, Landroid/graphics/Path;->set(Landroid/graphics/Path;)V

    .line 315
    return-object p1
.end method

.method public getGestureStrokeAngleThreshold()F
    .locals 1

    .prologue
    .line 260
    iget v0, p0, Landroid/gesture/GestureOverlayView;->mGestureStrokeAngleThreshold:F

    return v0
.end method

.method public getGestureStrokeLengthThreshold()F
    .locals 1

    .prologue
    .line 244
    iget v0, p0, Landroid/gesture/GestureOverlayView;->mGestureStrokeLengthThreshold:F

    return v0
.end method

.method public getGestureStrokeSquarenessTreshold()F
    .locals 1

    .prologue
    .line 252
    iget v0, p0, Landroid/gesture/GestureOverlayView;->mGestureStrokeSquarenessTreshold:F

    return v0
.end method

.method public getGestureStrokeType()I
    .locals 1

    .prologue
    .line 236
    iget v0, p0, Landroid/gesture/GestureOverlayView;->mGestureStrokeType:I

    return v0
.end method

.method public getGestureStrokeWidth()F
    .locals 1

    .prologue
    .line 226
    iget v0, p0, Landroid/gesture/GestureOverlayView;->mGestureStrokeWidth:F

    return v0
.end method

.method public getOrientation()I
    .locals 1

    .prologue
    .line 202
    iget v0, p0, Landroid/gesture/GestureOverlayView;->mOrientation:I

    return v0
.end method

.method public getUncertainGestureColor()I
    .locals 1

    .prologue
    .line 218
    iget v0, p0, Landroid/gesture/GestureOverlayView;->mUncertainGestureColor:I

    return v0
.end method

.method public isEventsInterceptionEnabled()Z
    .locals 1

    .prologue
    .line 268
    iget-boolean v0, p0, Landroid/gesture/GestureOverlayView;->mInterceptEvents:Z

    return v0
.end method

.method public isFadeEnabled()Z
    .locals 1

    .prologue
    .line 276
    iget-boolean v0, p0, Landroid/gesture/GestureOverlayView;->mFadeEnabled:Z

    return v0
.end method

.method public isGestureVisible()Z
    .locals 1

    .prologue
    .line 319
    iget-boolean v0, p0, Landroid/gesture/GestureOverlayView;->mGestureVisible:Z

    return v0
.end method

.method public isGesturing()Z
    .locals 1

    .prologue
    .line 378
    iget-boolean v0, p0, Landroid/gesture/GestureOverlayView;->mIsGesturing:Z

    return v0
.end method

.method protected onDetachedFromWindow()V
    .locals 0

    .prologue
    .line 496
    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V

    .line 497
    invoke-virtual {p0}, Landroid/gesture/GestureOverlayView;->cancelClearAnimation()V

    .line 498
    return-void
.end method

.method public removeAllOnGestureListeners()V
    .locals 1

    .prologue
    .line 343
    iget-object v0, p0, Landroid/gesture/GestureOverlayView;->mOnGestureListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 344
    return-void
.end method

.method public removeAllOnGesturePerformedListeners()V
    .locals 1

    .prologue
    .line 361
    iget-object v0, p0, Landroid/gesture/GestureOverlayView;->mOnGesturePerformedListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 362
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/gesture/GestureOverlayView;->mHandleGestureActions:Z

    .line 363
    return-void
.end method

.method public removeAllOnGesturingListeners()V
    .locals 1

    .prologue
    .line 374
    iget-object v0, p0, Landroid/gesture/GestureOverlayView;->mOnGesturingListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 375
    return-void
.end method

.method public removeOnGestureListener(Landroid/gesture/GestureOverlayView$OnGestureListener;)V
    .locals 1
    .param p1, "listener"    # Landroid/gesture/GestureOverlayView$OnGestureListener;

    .prologue
    .line 339
    iget-object v0, p0, Landroid/gesture/GestureOverlayView;->mOnGestureListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 340
    return-void
.end method

.method public removeOnGesturePerformedListener(Landroid/gesture/GestureOverlayView$OnGesturePerformedListener;)V
    .locals 1
    .param p1, "listener"    # Landroid/gesture/GestureOverlayView$OnGesturePerformedListener;

    .prologue
    .line 354
    iget-object v0, p0, Landroid/gesture/GestureOverlayView;->mOnGesturePerformedListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 355
    iget-object v0, p0, Landroid/gesture/GestureOverlayView;->mOnGesturePerformedListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-gtz v0, :cond_0

    .line 356
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/gesture/GestureOverlayView;->mHandleGestureActions:Z

    .line 358
    :cond_0
    return-void
.end method

.method public removeOnGesturingListener(Landroid/gesture/GestureOverlayView$OnGesturingListener;)V
    .locals 1
    .param p1, "listener"    # Landroid/gesture/GestureOverlayView$OnGesturingListener;

    .prologue
    .line 370
    iget-object v0, p0, Landroid/gesture/GestureOverlayView;->mOnGesturingListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 371
    return-void
.end method

.method public setEventsInterceptionEnabled(Z)V
    .locals 0
    .param p1, "enabled"    # Z

    .prologue
    .line 272
    iput-boolean p1, p0, Landroid/gesture/GestureOverlayView;->mInterceptEvents:Z

    .line 273
    return-void
.end method

.method public setFadeEnabled(Z)V
    .locals 0
    .param p1, "fadeEnabled"    # Z

    .prologue
    .line 280
    iput-boolean p1, p0, Landroid/gesture/GestureOverlayView;->mFadeEnabled:Z

    .line 281
    return-void
.end method

.method public setFadeOffset(J)V
    .locals 1
    .param p1, "fadeOffset"    # J

    .prologue
    .line 331
    iput-wide p1, p0, Landroid/gesture/GestureOverlayView;->mFadeOffset:J

    .line 332
    return-void
.end method

.method public setGesture(Landroid/gesture/Gesture;)V
    .locals 9
    .param p1, "gesture"    # Landroid/gesture/Gesture;

    .prologue
    const/4 v8, 0x1

    const/high16 v7, 0x40000000    # 2.0f

    .line 288
    iget-object v2, p0, Landroid/gesture/GestureOverlayView;->mCurrentGesture:Landroid/gesture/Gesture;

    if-eqz v2, :cond_0

    .line 289
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Landroid/gesture/GestureOverlayView;->clear(Z)V

    .line 292
    :cond_0
    iget v2, p0, Landroid/gesture/GestureOverlayView;->mCertainGestureColor:I

    invoke-direct {p0, v2}, Landroid/gesture/GestureOverlayView;->setCurrentColor(I)V

    .line 293
    iput-object p1, p0, Landroid/gesture/GestureOverlayView;->mCurrentGesture:Landroid/gesture/Gesture;

    .line 295
    iget-object v2, p0, Landroid/gesture/GestureOverlayView;->mCurrentGesture:Landroid/gesture/Gesture;

    invoke-virtual {v2}, Landroid/gesture/Gesture;->toPath()Landroid/graphics/Path;

    move-result-object v1

    .line 296
    .local v1, "path":Landroid/graphics/Path;
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 297
    .local v0, "bounds":Landroid/graphics/RectF;
    invoke-virtual {v1, v0, v8}, Landroid/graphics/Path;->computeBounds(Landroid/graphics/RectF;Z)V

    .line 300
    iget-object v2, p0, Landroid/gesture/GestureOverlayView;->mPath:Landroid/graphics/Path;

    invoke-virtual {v2}, Landroid/graphics/Path;->rewind()V

    .line 301
    iget-object v2, p0, Landroid/gesture/GestureOverlayView;->mPath:Landroid/graphics/Path;

    iget v3, v0, Landroid/graphics/RectF;->left:F

    neg-float v3, v3

    invoke-virtual {p0}, Landroid/gesture/GestureOverlayView;->getWidth()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v5

    sub-float/2addr v4, v5

    div-float/2addr v4, v7

    add-float/2addr v3, v4

    iget v4, v0, Landroid/graphics/RectF;->top:F

    neg-float v4, v4

    invoke-virtual {p0}, Landroid/gesture/GestureOverlayView;->getHeight()I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v6

    sub-float/2addr v5, v6

    div-float/2addr v5, v7

    add-float/2addr v4, v5

    invoke-virtual {v2, v1, v3, v4}, Landroid/graphics/Path;->addPath(Landroid/graphics/Path;FF)V

    .line 304
    iput-boolean v8, p0, Landroid/gesture/GestureOverlayView;->mResetGesture:Z

    .line 306
    invoke-virtual {p0}, Landroid/gesture/GestureOverlayView;->invalidate()V

    .line 307
    return-void
.end method

.method public setGestureColor(I)V
    .locals 0
    .param p1, "color"    # I

    .prologue
    .line 210
    iput p1, p0, Landroid/gesture/GestureOverlayView;->mCertainGestureColor:I

    .line 211
    return-void
.end method

.method public setGestureStrokeAngleThreshold(F)V
    .locals 0
    .param p1, "gestureStrokeAngleThreshold"    # F

    .prologue
    .line 264
    iput p1, p0, Landroid/gesture/GestureOverlayView;->mGestureStrokeAngleThreshold:F

    .line 265
    return-void
.end method

.method public setGestureStrokeLengthThreshold(F)V
    .locals 0
    .param p1, "gestureStrokeLengthThreshold"    # F

    .prologue
    .line 248
    iput p1, p0, Landroid/gesture/GestureOverlayView;->mGestureStrokeLengthThreshold:F

    .line 249
    return-void
.end method

.method public setGestureStrokeSquarenessTreshold(F)V
    .locals 0
    .param p1, "gestureStrokeSquarenessTreshold"    # F

    .prologue
    .line 256
    iput p1, p0, Landroid/gesture/GestureOverlayView;->mGestureStrokeSquarenessTreshold:F

    .line 257
    return-void
.end method

.method public setGestureStrokeType(I)V
    .locals 0
    .param p1, "gestureStrokeType"    # I

    .prologue
    .line 240
    iput p1, p0, Landroid/gesture/GestureOverlayView;->mGestureStrokeType:I

    .line 241
    return-void
.end method

.method public setGestureStrokeWidth(F)V
    .locals 2
    .param p1, "gestureStrokeWidth"    # F

    .prologue
    .line 230
    iput p1, p0, Landroid/gesture/GestureOverlayView;->mGestureStrokeWidth:F

    .line 231
    const/4 v0, 0x1

    float-to-int v1, p1

    add-int/lit8 v1, v1, -0x1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Landroid/gesture/GestureOverlayView;->mInvalidateExtraBorder:I

    .line 232
    iget-object v0, p0, Landroid/gesture/GestureOverlayView;->mGesturePaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 233
    return-void
.end method

.method public setGestureVisible(Z)V
    .locals 0
    .param p1, "visible"    # Z

    .prologue
    .line 323
    iput-boolean p1, p0, Landroid/gesture/GestureOverlayView;->mGestureVisible:Z

    .line 324
    return-void
.end method

.method public setOrientation(I)V
    .locals 0
    .param p1, "orientation"    # I

    .prologue
    .line 206
    iput p1, p0, Landroid/gesture/GestureOverlayView;->mOrientation:I

    .line 207
    return-void
.end method

.method public setUncertainGestureColor(I)V
    .locals 0
    .param p1, "color"    # I

    .prologue
    .line 214
    iput p1, p0, Landroid/gesture/GestureOverlayView;->mUncertainGestureColor:I

    .line 215
    return-void
.end method
