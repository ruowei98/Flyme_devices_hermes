.class public Landroid/widget/GridView;
.super Landroid/widget/AbsListView;
.source "GridView.java"


# annotations
.annotation runtime Landroid/widget/RemoteViews$RemoteView;
.end annotation


# static fields
.field public static final AUTO_FIT:I = -0x1

.field public static final NO_STRETCH:I = 0x0

.field public static final STRETCH_COLUMN_WIDTH:I = 0x2

.field public static final STRETCH_SPACING:I = 0x1

.field public static final STRETCH_SPACING_UNIFORM:I = 0x3


# instance fields
.field private mColumnWidth:I

.field private mGravity:I

.field private mHorizontalSpacing:I

.field private mNumColumns:I

.field private mReferenceView:Landroid/view/View;

.field private mReferenceViewInSelectedRow:Landroid/view/View;

.field private mRequestedColumnWidth:I

.field private mRequestedHorizontalSpacing:I

.field private mRequestedNumColumns:I

.field private mStretchMode:I

.field private final mTempRect:Landroid/graphics/Rect;

.field private mVerticalSpacing:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 117
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/widget/GridView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 118
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 121
    const v0, 0x1010071

    invoke-direct {p0, p1, p2, v0}, Landroid/widget/GridView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 122
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 125
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Landroid/widget/GridView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 126
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 11
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    const/4 v6, 0x0

    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v8, -0x1

    const/4 v7, 0x0

    .line 129
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/AbsListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 99
    iput v8, p0, Landroid/widget/GridView;->mNumColumns:I

    .line 101
    iput v7, p0, Landroid/widget/GridView;->mHorizontalSpacing:I

    .line 103
    iput v7, p0, Landroid/widget/GridView;->mVerticalSpacing:I

    .line 104
    iput v10, p0, Landroid/widget/GridView;->mStretchMode:I

    .line 109
    iput-object v6, p0, Landroid/widget/GridView;->mReferenceView:Landroid/view/View;

    .line 110
    iput-object v6, p0, Landroid/widget/GridView;->mReferenceViewInSelectedRow:Landroid/view/View;

    .line 112
    const v6, 0x800003

    iput v6, p0, Landroid/widget/GridView;->mGravity:I

    .line 114
    new-instance v6, Landroid/graphics/Rect;

    invoke-direct {v6}, Landroid/graphics/Rect;-><init>()V

    iput-object v6, p0, Landroid/widget/GridView;->mTempRect:Landroid/graphics/Rect;

    .line 131
    sget-object v6, Lcom/android/internal/R$styleable;->GridView:[I

    invoke-virtual {p1, p2, v6, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 134
    .local v0, "a":Landroid/content/res/TypedArray;
    invoke-virtual {v0, v9, v7}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v2

    .line 136
    .local v2, "hSpacing":I
    invoke-virtual {p0, v2}, Landroid/widget/GridView;->setHorizontalSpacing(I)V

    .line 138
    invoke-virtual {v0, v10, v7}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v5

    .line 140
    .local v5, "vSpacing":I
    invoke-virtual {p0, v5}, Landroid/widget/GridView;->setVerticalSpacing(I)V

    .line 142
    const/4 v6, 0x3

    invoke-virtual {v0, v6, v10}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v3

    .line 143
    .local v3, "index":I
    if-ltz v3, :cond_0

    .line 144
    invoke-virtual {p0, v3}, Landroid/widget/GridView;->setStretchMode(I)V

    .line 147
    :cond_0
    const/4 v6, 0x4

    invoke-virtual {v0, v6, v8}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v1

    .line 148
    .local v1, "columnWidth":I
    if-lez v1, :cond_1

    .line 149
    invoke-virtual {p0, v1}, Landroid/widget/GridView;->setColumnWidth(I)V

    .line 152
    :cond_1
    const/4 v6, 0x5

    invoke-virtual {v0, v6, v9}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v4

    .line 153
    .local v4, "numColumns":I
    invoke-virtual {p0, v4}, Landroid/widget/GridView;->setNumColumns(I)V

    .line 155
    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v3

    .line 156
    if-ltz v3, :cond_2

    .line 157
    invoke-virtual {p0, v3}, Landroid/widget/GridView;->setGravity(I)V

    .line 160
    :cond_2
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 162
    invoke-virtual {p0, v9}, Landroid/widget/GridView;->setGridView(Z)V

    .line 163
    return-void
.end method

.method private adjustForBottomFadingEdge(Landroid/view/View;II)V
    .locals 4
    .param p1, "childInSelectedRow"    # Landroid/view/View;
    .param p2, "topSelectionPixel"    # I
    .param p3, "bottomSelectionPixel"    # I

    .prologue
    .line 800
    invoke-virtual {p1}, Landroid/view/View;->getBottom()I

    move-result v3

    if-le v3, p3, :cond_0

    .line 804
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v3

    sub-int v1, v3, p2

    .line 808
    .local v1, "spaceAbove":I
    invoke-virtual {p1}, Landroid/view/View;->getBottom()I

    move-result v3

    sub-int v2, v3, p3

    .line 809
    .local v2, "spaceBelow":I
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 812
    .local v0, "offset":I
    neg-int v3, v0

    invoke-virtual {p0, v3}, Landroid/widget/GridView;->offsetChildrenTopAndBottom(I)V

    .line 814
    .end local v0    # "offset":I
    .end local v1    # "spaceAbove":I
    .end local v2    # "spaceBelow":I
    :cond_0
    return-void
.end method

.method private adjustForTopFadingEdge(Landroid/view/View;II)V
    .locals 4
    .param p1, "childInSelectedRow"    # Landroid/view/View;
    .param p2, "topSelectionPixel"    # I
    .param p3, "bottomSelectionPixel"    # I

    .prologue
    .line 828
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v3

    if-ge v3, p2, :cond_0

    .line 831
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v3

    sub-int v1, p2, v3

    .line 835
    .local v1, "spaceAbove":I
    invoke-virtual {p1}, Landroid/view/View;->getBottom()I

    move-result v3

    sub-int v2, p3, v3

    .line 836
    .local v2, "spaceBelow":I
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 839
    .local v0, "offset":I
    invoke-virtual {p0, v0}, Landroid/widget/GridView;->offsetChildrenTopAndBottom(I)V

    .line 841
    .end local v0    # "offset":I
    .end local v1    # "spaceAbove":I
    .end local v2    # "spaceBelow":I
    :cond_0
    return-void
.end method

.method private adjustViewsUpOrDown()V
    .locals 6

    .prologue
    .line 2249
    invoke-virtual {p0}, Landroid/widget/GridView;->getChildCount()I

    move-result v1

    .line 2251
    .local v1, "childCount":I
    if-lez v1, :cond_2

    .line 2255
    iget-boolean v3, p0, Landroid/widget/GridView;->mStackFromBottom:Z

    if-nez v3, :cond_3

    .line 2258
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Landroid/widget/GridView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 2259
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v3

    iget-object v4, p0, Landroid/widget/GridView;->mListPadding:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->top:I

    sub-int v2, v3, v4

    .line 2260
    .local v2, "delta":I
    iget v3, p0, Landroid/widget/GridView;->mFirstPosition:I

    if-eqz v3, :cond_0

    .line 2263
    iget v3, p0, Landroid/widget/GridView;->mVerticalSpacing:I

    sub-int/2addr v2, v3

    .line 2265
    :cond_0
    if-gez v2, :cond_1

    .line 2267
    const/4 v2, 0x0

    .line 2286
    :cond_1
    :goto_0
    if-eqz v2, :cond_2

    .line 2287
    neg-int v3, v2

    invoke-virtual {p0, v3}, Landroid/widget/GridView;->offsetChildrenTopAndBottom(I)V

    .line 2290
    .end local v0    # "child":Landroid/view/View;
    .end local v2    # "delta":I
    :cond_2
    return-void

    .line 2271
    :cond_3
    add-int/lit8 v3, v1, -0x1

    invoke-virtual {p0, v3}, Landroid/widget/GridView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 2272
    .restart local v0    # "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getBottom()I

    move-result v3

    invoke-virtual {p0}, Landroid/widget/GridView;->getHeight()I

    move-result v4

    iget-object v5, p0, Landroid/widget/GridView;->mListPadding:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v4, v5

    sub-int v2, v3, v4

    .line 2274
    .restart local v2    # "delta":I
    iget v3, p0, Landroid/widget/GridView;->mFirstPosition:I

    add-int/2addr v3, v1

    iget v4, p0, Landroid/widget/GridView;->mItemCount:I

    if-ge v3, v4, :cond_4

    .line 2277
    iget v3, p0, Landroid/widget/GridView;->mVerticalSpacing:I

    add-int/2addr v2, v3

    .line 2280
    :cond_4
    if-lez v2, :cond_1

    .line 2282
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private commonKey(IILandroid/view/KeyEvent;)Z
    .locals 8
    .param p1, "keyCode"    # I
    .param p2, "count"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v7, 0x2

    const/16 v6, 0x82

    const/16 v5, 0x21

    const/4 v2, 0x0

    const/4 v3, 0x1

    .line 1630
    iget-object v4, p0, Landroid/widget/GridView;->mAdapter:Landroid/widget/ListAdapter;

    if-nez v4, :cond_0

    .line 1757
    :goto_0
    return v2

    .line 1634
    :cond_0
    iget-boolean v4, p0, Landroid/widget/GridView;->mDataChanged:Z

    if-eqz v4, :cond_1

    .line 1635
    invoke-virtual {p0}, Landroid/widget/GridView;->layoutChildren()V

    .line 1638
    :cond_1
    const/4 v1, 0x0

    .line 1639
    .local v1, "handled":Z
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    .line 1641
    .local v0, "action":I
    if-eq v0, v3, :cond_2

    .line 1642
    sparse-switch p1, :sswitch_data_0

    .line 1741
    :cond_2
    :goto_1
    if-eqz v1, :cond_25

    move v2, v3

    .line 1742
    goto :goto_0

    .line 1644
    :sswitch_0
    invoke-virtual {p3}, Landroid/view/KeyEvent;->hasNoModifiers()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 1645
    invoke-virtual {p0}, Landroid/widget/GridView;->resurrectSelectionIfNeeded()Z

    move-result v4

    if-nez v4, :cond_3

    const/16 v4, 0x11

    invoke-virtual {p0, v4}, Landroid/widget/GridView;->arrowScroll(I)Z

    move-result v4

    if-eqz v4, :cond_4

    :cond_3
    move v1, v3

    :goto_2
    goto :goto_1

    :cond_4
    move v1, v2

    goto :goto_2

    .line 1650
    :sswitch_1
    invoke-virtual {p3}, Landroid/view/KeyEvent;->hasNoModifiers()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 1651
    invoke-virtual {p0}, Landroid/widget/GridView;->resurrectSelectionIfNeeded()Z

    move-result v4

    if-nez v4, :cond_5

    const/16 v4, 0x42

    invoke-virtual {p0, v4}, Landroid/widget/GridView;->arrowScroll(I)Z

    move-result v4

    if-eqz v4, :cond_6

    :cond_5
    move v1, v3

    :goto_3
    goto :goto_1

    :cond_6
    move v1, v2

    goto :goto_3

    .line 1656
    :sswitch_2
    invoke-virtual {p3}, Landroid/view/KeyEvent;->hasNoModifiers()Z

    move-result v4

    if-eqz v4, :cond_9

    .line 1657
    invoke-virtual {p0}, Landroid/widget/GridView;->resurrectSelectionIfNeeded()Z

    move-result v4

    if-nez v4, :cond_7

    invoke-virtual {p0, v5}, Landroid/widget/GridView;->arrowScroll(I)Z

    move-result v4

    if-eqz v4, :cond_8

    :cond_7
    move v1, v3

    :goto_4
    goto :goto_1

    :cond_8
    move v1, v2

    goto :goto_4

    .line 1658
    :cond_9
    invoke-virtual {p3, v7}, Landroid/view/KeyEvent;->hasModifiers(I)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 1659
    invoke-virtual {p0}, Landroid/widget/GridView;->resurrectSelectionIfNeeded()Z

    move-result v4

    if-nez v4, :cond_a

    invoke-virtual {p0, v5}, Landroid/widget/GridView;->fullScroll(I)Z

    move-result v4

    if-eqz v4, :cond_b

    :cond_a
    move v1, v3

    :goto_5
    goto :goto_1

    :cond_b
    move v1, v2

    goto :goto_5

    .line 1664
    :sswitch_3
    invoke-virtual {p3}, Landroid/view/KeyEvent;->hasNoModifiers()Z

    move-result v4

    if-eqz v4, :cond_e

    .line 1665
    invoke-virtual {p0}, Landroid/widget/GridView;->resurrectSelectionIfNeeded()Z

    move-result v4

    if-nez v4, :cond_c

    invoke-virtual {p0, v6}, Landroid/widget/GridView;->arrowScroll(I)Z

    move-result v4

    if-eqz v4, :cond_d

    :cond_c
    move v1, v3

    :goto_6
    goto :goto_1

    :cond_d
    move v1, v2

    goto :goto_6

    .line 1666
    :cond_e
    invoke-virtual {p3, v7}, Landroid/view/KeyEvent;->hasModifiers(I)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 1667
    invoke-virtual {p0}, Landroid/widget/GridView;->resurrectSelectionIfNeeded()Z

    move-result v4

    if-nez v4, :cond_f

    invoke-virtual {p0, v6}, Landroid/widget/GridView;->fullScroll(I)Z

    move-result v4

    if-eqz v4, :cond_10

    :cond_f
    move v1, v3

    :goto_7
    goto/16 :goto_1

    :cond_10
    move v1, v2

    goto :goto_7

    .line 1673
    :sswitch_4
    invoke-virtual {p3}, Landroid/view/KeyEvent;->hasNoModifiers()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 1674
    invoke-virtual {p0}, Landroid/widget/GridView;->resurrectSelectionIfNeeded()Z

    move-result v1

    .line 1675
    if-nez v1, :cond_2

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v4

    if-nez v4, :cond_2

    invoke-virtual {p0}, Landroid/widget/GridView;->getChildCount()I

    move-result v4

    if-lez v4, :cond_2

    .line 1677
    invoke-virtual {p0}, Landroid/widget/GridView;->keyPressed()V

    .line 1678
    const/4 v1, 0x1

    goto/16 :goto_1

    .line 1684
    :sswitch_5
    iget-object v4, p0, Landroid/widget/GridView;->mPopup:Landroid/widget/PopupWindow;

    if-eqz v4, :cond_11

    iget-object v4, p0, Landroid/widget/GridView;->mPopup:Landroid/widget/PopupWindow;

    invoke-virtual {v4}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v4

    if-nez v4, :cond_2

    .line 1685
    :cond_11
    invoke-virtual {p3}, Landroid/view/KeyEvent;->hasNoModifiers()Z

    move-result v4

    if-eqz v4, :cond_14

    .line 1686
    invoke-virtual {p0}, Landroid/widget/GridView;->resurrectSelectionIfNeeded()Z

    move-result v4

    if-nez v4, :cond_12

    invoke-virtual {p0, v6}, Landroid/widget/GridView;->pageScroll(I)Z

    move-result v4

    if-eqz v4, :cond_13

    :cond_12
    move v1, v3

    :goto_8
    goto/16 :goto_1

    :cond_13
    move v1, v2

    goto :goto_8

    .line 1687
    :cond_14
    invoke-virtual {p3, v3}, Landroid/view/KeyEvent;->hasModifiers(I)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 1688
    invoke-virtual {p0}, Landroid/widget/GridView;->resurrectSelectionIfNeeded()Z

    move-result v4

    if-nez v4, :cond_15

    invoke-virtual {p0, v5}, Landroid/widget/GridView;->pageScroll(I)Z

    move-result v4

    if-eqz v4, :cond_16

    :cond_15
    move v1, v3

    :goto_9
    goto/16 :goto_1

    :cond_16
    move v1, v2

    goto :goto_9

    .line 1694
    :sswitch_6
    invoke-virtual {p3}, Landroid/view/KeyEvent;->hasNoModifiers()Z

    move-result v4

    if-eqz v4, :cond_19

    .line 1695
    invoke-virtual {p0}, Landroid/widget/GridView;->resurrectSelectionIfNeeded()Z

    move-result v4

    if-nez v4, :cond_17

    invoke-virtual {p0, v5}, Landroid/widget/GridView;->pageScroll(I)Z

    move-result v4

    if-eqz v4, :cond_18

    :cond_17
    move v1, v3

    :goto_a
    goto/16 :goto_1

    :cond_18
    move v1, v2

    goto :goto_a

    .line 1696
    :cond_19
    invoke-virtual {p3, v7}, Landroid/view/KeyEvent;->hasModifiers(I)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 1697
    invoke-virtual {p0}, Landroid/widget/GridView;->resurrectSelectionIfNeeded()Z

    move-result v4

    if-nez v4, :cond_1a

    invoke-virtual {p0, v5}, Landroid/widget/GridView;->fullScroll(I)Z

    move-result v4

    if-eqz v4, :cond_1b

    :cond_1a
    move v1, v3

    :goto_b
    goto/16 :goto_1

    :cond_1b
    move v1, v2

    goto :goto_b

    .line 1702
    :sswitch_7
    invoke-virtual {p3}, Landroid/view/KeyEvent;->hasNoModifiers()Z

    move-result v4

    if-eqz v4, :cond_1e

    .line 1703
    invoke-virtual {p0}, Landroid/widget/GridView;->resurrectSelectionIfNeeded()Z

    move-result v4

    if-nez v4, :cond_1c

    invoke-virtual {p0, v6}, Landroid/widget/GridView;->pageScroll(I)Z

    move-result v4

    if-eqz v4, :cond_1d

    :cond_1c
    move v1, v3

    :goto_c
    goto/16 :goto_1

    :cond_1d
    move v1, v2

    goto :goto_c

    .line 1704
    :cond_1e
    invoke-virtual {p3, v7}, Landroid/view/KeyEvent;->hasModifiers(I)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 1705
    invoke-virtual {p0}, Landroid/widget/GridView;->resurrectSelectionIfNeeded()Z

    move-result v4

    if-nez v4, :cond_1f

    invoke-virtual {p0, v6}, Landroid/widget/GridView;->fullScroll(I)Z

    move-result v4

    if-eqz v4, :cond_20

    :cond_1f
    move v1, v3

    :goto_d
    goto/16 :goto_1

    :cond_20
    move v1, v2

    goto :goto_d

    .line 1710
    :sswitch_8
    invoke-virtual {p3}, Landroid/view/KeyEvent;->hasNoModifiers()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 1711
    invoke-virtual {p0}, Landroid/widget/GridView;->resurrectSelectionIfNeeded()Z

    move-result v4

    if-nez v4, :cond_21

    invoke-virtual {p0, v5}, Landroid/widget/GridView;->fullScroll(I)Z

    move-result v4

    if-eqz v4, :cond_22

    :cond_21
    move v1, v3

    :goto_e
    goto/16 :goto_1

    :cond_22
    move v1, v2

    goto :goto_e

    .line 1716
    :sswitch_9
    invoke-virtual {p3}, Landroid/view/KeyEvent;->hasNoModifiers()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 1717
    invoke-virtual {p0}, Landroid/widget/GridView;->resurrectSelectionIfNeeded()Z

    move-result v4

    if-nez v4, :cond_23

    invoke-virtual {p0, v6}, Landroid/widget/GridView;->fullScroll(I)Z

    move-result v4

    if-eqz v4, :cond_24

    :cond_23
    move v1, v3

    :goto_f
    goto/16 :goto_1

    :cond_24
    move v1, v2

    goto :goto_f

    .line 1745
    :cond_25
    invoke-virtual {p0, p1, p2, p3}, Landroid/widget/GridView;->sendToTextFilter(IILandroid/view/KeyEvent;)Z

    move-result v4

    if-eqz v4, :cond_26

    move v2, v3

    .line 1746
    goto/16 :goto_0

    .line 1749
    :cond_26
    packed-switch v0, :pswitch_data_0

    goto/16 :goto_0

    .line 1751
    :pswitch_0
    invoke-super {p0, p1, p3}, Landroid/widget/AbsListView;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v2

    goto/16 :goto_0

    .line 1753
    :pswitch_1
    invoke-super {p0, p1, p3}, Landroid/widget/AbsListView;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v2

    goto/16 :goto_0

    .line 1755
    :pswitch_2
    invoke-super {p0, p1, p2, p3}, Landroid/widget/AbsListView;->onKeyMultiple(IILandroid/view/KeyEvent;)Z

    move-result v2

    goto/16 :goto_0

    .line 1642
    :sswitch_data_0
    .sparse-switch
        0x13 -> :sswitch_2
        0x14 -> :sswitch_3
        0x15 -> :sswitch_0
        0x16 -> :sswitch_1
        0x17 -> :sswitch_4
        0x3e -> :sswitch_5
        0x42 -> :sswitch_4
        0x5c -> :sswitch_6
        0x5d -> :sswitch_7
        0x7a -> :sswitch_8
        0x7b -> :sswitch_9
    .end sparse-switch

    .line 1749
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private correctTooHigh(III)V
    .locals 9
    .param p1, "numColumns"    # I
    .param p2, "verticalSpacing"    # I
    .param p3, "childCount"    # I

    .prologue
    .line 612
    iget v7, p0, Landroid/widget/GridView;->mFirstPosition:I

    add-int/2addr v7, p3

    add-int/lit8 v6, v7, -0x1

    .line 613
    .local v6, "lastPosition":I
    iget v7, p0, Landroid/widget/GridView;->mItemCount:I

    add-int/lit8 v7, v7, -0x1

    if-ne v6, v7, :cond_3

    if-lez p3, :cond_3

    .line 615
    add-int/lit8 v7, p3, -0x1

    invoke-virtual {p0, v7}, Landroid/widget/GridView;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 618
    .local v5, "lastChild":Landroid/view/View;
    invoke-virtual {v5}, Landroid/view/View;->getBottom()I

    move-result v4

    .line 620
    .local v4, "lastBottom":I
    iget v7, p0, Landroid/widget/GridView;->mBottom:I

    iget v8, p0, Landroid/widget/GridView;->mTop:I

    sub-int/2addr v7, v8

    iget-object v8, p0, Landroid/widget/GridView;->mListPadding:Landroid/graphics/Rect;

    iget v8, v8, Landroid/graphics/Rect;->bottom:I

    sub-int v1, v7, v8

    .line 624
    .local v1, "end":I
    sub-int v0, v1, v4

    .line 626
    .local v0, "bottomOffset":I
    const/4 v7, 0x0

    invoke-virtual {p0, v7}, Landroid/widget/GridView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 627
    .local v2, "firstChild":Landroid/view/View;
    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    move-result v3

    .line 631
    .local v3, "firstTop":I
    if-lez v0, :cond_3

    iget v7, p0, Landroid/widget/GridView;->mFirstPosition:I

    if-gtz v7, :cond_0

    iget-object v7, p0, Landroid/widget/GridView;->mListPadding:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->top:I

    if-ge v3, v7, :cond_3

    .line 632
    :cond_0
    iget v7, p0, Landroid/widget/GridView;->mFirstPosition:I

    if-nez v7, :cond_1

    .line 634
    iget-object v7, p0, Landroid/widget/GridView;->mListPadding:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->top:I

    sub-int/2addr v7, v3

    invoke-static {v0, v7}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 638
    :cond_1
    invoke-virtual {p0, v0}, Landroid/widget/GridView;->offsetChildrenTopAndBottom(I)V

    .line 639
    iget v7, p0, Landroid/widget/GridView;->mFirstPosition:I

    if-lez v7, :cond_3

    .line 642
    iget v7, p0, Landroid/widget/GridView;->mFirstPosition:I

    iget-boolean v8, p0, Landroid/widget/GridView;->mStackFromBottom:Z

    if-eqz v8, :cond_2

    const/4 p1, 0x1

    .end local p1    # "numColumns":I
    :cond_2
    sub-int/2addr v7, p1

    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    move-result v8

    sub-int/2addr v8, p2

    invoke-direct {p0, v7, v8}, Landroid/widget/GridView;->fillUp(II)Landroid/view/View;

    .line 645
    invoke-direct {p0}, Landroid/widget/GridView;->adjustViewsUpOrDown()V

    .line 649
    .end local v0    # "bottomOffset":I
    .end local v1    # "end":I
    .end local v2    # "firstChild":Landroid/view/View;
    .end local v3    # "firstTop":I
    .end local v4    # "lastBottom":I
    .end local v5    # "lastChild":Landroid/view/View;
    :cond_3
    return-void
.end method

.method private correctTooLow(III)V
    .locals 10
    .param p1, "numColumns"    # I
    .param p2, "verticalSpacing"    # I
    .param p3, "childCount"    # I

    .prologue
    .line 652
    iget v8, p0, Landroid/widget/GridView;->mFirstPosition:I

    if-nez v8, :cond_3

    if-lez p3, :cond_3

    .line 654
    const/4 v8, 0x0

    invoke-virtual {p0, v8}, Landroid/widget/GridView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 657
    .local v1, "firstChild":Landroid/view/View;
    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v2

    .line 660
    .local v2, "firstTop":I
    iget-object v8, p0, Landroid/widget/GridView;->mListPadding:Landroid/graphics/Rect;

    iget v6, v8, Landroid/graphics/Rect;->top:I

    .line 663
    .local v6, "start":I
    iget v8, p0, Landroid/widget/GridView;->mBottom:I

    iget v9, p0, Landroid/widget/GridView;->mTop:I

    sub-int/2addr v8, v9

    iget-object v9, p0, Landroid/widget/GridView;->mListPadding:Landroid/graphics/Rect;

    iget v9, v9, Landroid/graphics/Rect;->bottom:I

    sub-int v0, v8, v9

    .line 667
    .local v0, "end":I
    sub-int v7, v2, v6

    .line 668
    .local v7, "topOffset":I
    add-int/lit8 v8, p3, -0x1

    invoke-virtual {p0, v8}, Landroid/widget/GridView;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 669
    .local v4, "lastChild":Landroid/view/View;
    invoke-virtual {v4}, Landroid/view/View;->getBottom()I

    move-result v3

    .line 670
    .local v3, "lastBottom":I
    iget v8, p0, Landroid/widget/GridView;->mFirstPosition:I

    add-int/2addr v8, p3

    add-int/lit8 v5, v8, -0x1

    .line 674
    .local v5, "lastPosition":I
    if-lez v7, :cond_3

    iget v8, p0, Landroid/widget/GridView;->mItemCount:I

    add-int/lit8 v8, v8, -0x1

    if-lt v5, v8, :cond_0

    if-le v3, v0, :cond_3

    .line 675
    :cond_0
    iget v8, p0, Landroid/widget/GridView;->mItemCount:I

    add-int/lit8 v8, v8, -0x1

    if-ne v5, v8, :cond_1

    .line 677
    sub-int v8, v3, v0

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 681
    :cond_1
    neg-int v8, v7

    invoke-virtual {p0, v8}, Landroid/widget/GridView;->offsetChildrenTopAndBottom(I)V

    .line 682
    iget v8, p0, Landroid/widget/GridView;->mItemCount:I

    add-int/lit8 v8, v8, -0x1

    if-ge v5, v8, :cond_3

    .line 685
    iget-boolean v8, p0, Landroid/widget/GridView;->mStackFromBottom:Z

    if-nez v8, :cond_2

    const/4 p1, 0x1

    .end local p1    # "numColumns":I
    :cond_2
    add-int v8, v5, p1

    invoke-virtual {v4}, Landroid/view/View;->getBottom()I

    move-result v9

    add-int/2addr v9, p2

    invoke-direct {p0, v8, v9}, Landroid/widget/GridView;->fillDown(II)Landroid/view/View;

    .line 688
    invoke-direct {p0}, Landroid/widget/GridView;->adjustViewsUpOrDown()V

    .line 692
    .end local v0    # "end":I
    .end local v1    # "firstChild":Landroid/view/View;
    .end local v2    # "firstTop":I
    .end local v3    # "lastBottom":I
    .end local v4    # "lastChild":Landroid/view/View;
    .end local v5    # "lastPosition":I
    .end local v6    # "start":I
    .end local v7    # "topOffset":I
    :cond_3
    return-void
.end method

.method private determineColumns(I)Z
    .locals 8
    .param p1, "availableSpace"    # I

    .prologue
    const/4 v7, 0x1

    .line 961
    iget v2, p0, Landroid/widget/GridView;->mRequestedHorizontalSpacing:I

    .line 962
    .local v2, "requestedHorizontalSpacing":I
    iget v4, p0, Landroid/widget/GridView;->mStretchMode:I

    .line 963
    .local v4, "stretchMode":I
    iget v1, p0, Landroid/widget/GridView;->mRequestedColumnWidth:I

    .line 964
    .local v1, "requestedColumnWidth":I
    const/4 v0, 0x0

    .line 966
    .local v0, "didNotInitiallyFit":Z
    iget v5, p0, Landroid/widget/GridView;->mRequestedNumColumns:I

    const/4 v6, -0x1

    if-ne v5, v6, :cond_3

    .line 967
    if-lez v1, :cond_2

    .line 969
    add-int v5, p1, v2

    add-int v6, v1, v2

    div-int/2addr v5, v6

    iput v5, p0, Landroid/widget/GridView;->mNumColumns:I

    .line 980
    :goto_0
    iget v5, p0, Landroid/widget/GridView;->mNumColumns:I

    if-gtz v5, :cond_0

    .line 981
    iput v7, p0, Landroid/widget/GridView;->mNumColumns:I

    .line 984
    :cond_0
    packed-switch v4, :pswitch_data_0

    .line 992
    iget v5, p0, Landroid/widget/GridView;->mNumColumns:I

    mul-int/2addr v5, v1

    sub-int v5, p1, v5

    iget v6, p0, Landroid/widget/GridView;->mNumColumns:I

    add-int/lit8 v6, v6, -0x1

    mul-int/2addr v6, v2

    sub-int v3, v5, v6

    .line 995
    .local v3, "spaceLeftOver":I
    if-gez v3, :cond_1

    .line 996
    const/4 v0, 0x1

    .line 999
    :cond_1
    packed-switch v4, :pswitch_data_1

    .line 1031
    .end local v3    # "spaceLeftOver":I
    :goto_1
    return v0

    .line 973
    :cond_2
    const/4 v5, 0x2

    iput v5, p0, Landroid/widget/GridView;->mNumColumns:I

    goto :goto_0

    .line 977
    :cond_3
    iget v5, p0, Landroid/widget/GridView;->mRequestedNumColumns:I

    iput v5, p0, Landroid/widget/GridView;->mNumColumns:I

    goto :goto_0

    .line 987
    :pswitch_0
    iput v1, p0, Landroid/widget/GridView;->mColumnWidth:I

    .line 988
    iput v2, p0, Landroid/widget/GridView;->mHorizontalSpacing:I

    goto :goto_1

    .line 1002
    .restart local v3    # "spaceLeftOver":I
    :pswitch_1
    iget v5, p0, Landroid/widget/GridView;->mNumColumns:I

    div-int v5, v3, v5

    add-int/2addr v5, v1

    iput v5, p0, Landroid/widget/GridView;->mColumnWidth:I

    .line 1003
    iput v2, p0, Landroid/widget/GridView;->mHorizontalSpacing:I

    goto :goto_1

    .line 1008
    :pswitch_2
    iput v1, p0, Landroid/widget/GridView;->mColumnWidth:I

    .line 1009
    iget v5, p0, Landroid/widget/GridView;->mNumColumns:I

    if-le v5, v7, :cond_4

    .line 1010
    iget v5, p0, Landroid/widget/GridView;->mNumColumns:I

    add-int/lit8 v5, v5, -0x1

    div-int v5, v3, v5

    add-int/2addr v5, v2

    iput v5, p0, Landroid/widget/GridView;->mHorizontalSpacing:I

    goto :goto_1

    .line 1013
    :cond_4
    add-int v5, v2, v3

    iput v5, p0, Landroid/widget/GridView;->mHorizontalSpacing:I

    goto :goto_1

    .line 1019
    :pswitch_3
    iput v1, p0, Landroid/widget/GridView;->mColumnWidth:I

    .line 1020
    iget v5, p0, Landroid/widget/GridView;->mNumColumns:I

    if-le v5, v7, :cond_5

    .line 1021
    iget v5, p0, Landroid/widget/GridView;->mNumColumns:I

    add-int/lit8 v5, v5, 0x1

    div-int v5, v3, v5

    add-int/2addr v5, v2

    iput v5, p0, Landroid/widget/GridView;->mHorizontalSpacing:I

    goto :goto_1

    .line 1024
    :cond_5
    add-int v5, v2, v3

    iput v5, p0, Landroid/widget/GridView;->mHorizontalSpacing:I

    goto :goto_1

    .line 984
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch

    .line 999
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_3
    .end packed-switch
.end method

.method private fillDown(II)Landroid/view/View;
    .locals 6
    .param p1, "pos"    # I
    .param p2, "nextTop"    # I

    .prologue
    .line 296
    const/4 v1, 0x0

    .line 298
    .local v1, "selectedView":Landroid/view/View;
    iget v3, p0, Landroid/widget/GridView;->mBottom:I

    iget v4, p0, Landroid/widget/GridView;->mTop:I

    sub-int v0, v3, v4

    .line 299
    .local v0, "end":I
    iget v3, p0, Landroid/widget/GridView;->mGroupFlags:I

    and-int/lit8 v3, v3, 0x22

    const/16 v4, 0x22

    if-ne v3, v4, :cond_0

    .line 300
    iget-object v3, p0, Landroid/widget/GridView;->mListPadding:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v0, v3

    .line 303
    :cond_0
    :goto_0
    if-ge p2, v0, :cond_2

    iget v3, p0, Landroid/widget/GridView;->mItemCount:I

    if-ge p1, v3, :cond_2

    .line 304
    const/4 v3, 0x1

    invoke-direct {p0, p1, p2, v3}, Landroid/widget/GridView;->makeRow(IIZ)Landroid/view/View;

    move-result-object v2

    .line 305
    .local v2, "temp":Landroid/view/View;
    if-eqz v2, :cond_1

    .line 306
    move-object v1, v2

    .line 311
    :cond_1
    iget-object v3, p0, Landroid/widget/GridView;->mReferenceView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getBottom()I

    move-result v3

    iget v4, p0, Landroid/widget/GridView;->mVerticalSpacing:I

    add-int p2, v3, v4

    .line 313
    iget v3, p0, Landroid/widget/GridView;->mNumColumns:I

    add-int/2addr p1, v3

    .line 314
    goto :goto_0

    .line 316
    .end local v2    # "temp":Landroid/view/View;
    :cond_2
    iget v3, p0, Landroid/widget/GridView;->mFirstPosition:I

    iget v4, p0, Landroid/widget/GridView;->mFirstPosition:I

    invoke-virtual {p0}, Landroid/widget/GridView;->getChildCount()I

    move-result v5

    add-int/2addr v4, v5

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {p0, v3, v4}, Landroid/widget/GridView;->setVisibleRangeHint(II)V

    .line 317
    return-object v1
.end method

.method private fillFromBottom(II)Landroid/view/View;
    .locals 3
    .param p1, "lastPosition"    # I
    .param p2, "nextBottom"    # I

    .prologue
    .line 443
    iget v1, p0, Landroid/widget/GridView;->mSelectedPosition:I

    invoke-static {p1, v1}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 444
    iget v1, p0, Landroid/widget/GridView;->mItemCount:I

    add-int/lit8 v1, v1, -0x1

    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 446
    iget v1, p0, Landroid/widget/GridView;->mItemCount:I

    add-int/lit8 v1, v1, -0x1

    sub-int v0, v1, p1

    .line 447
    .local v0, "invertedPosition":I
    iget v1, p0, Landroid/widget/GridView;->mItemCount:I

    add-int/lit8 v1, v1, -0x1

    iget v2, p0, Landroid/widget/GridView;->mNumColumns:I

    rem-int v2, v0, v2

    sub-int v2, v0, v2

    sub-int p1, v1, v2

    .line 449
    invoke-direct {p0, p1, p2}, Landroid/widget/GridView;->fillUp(II)Landroid/view/View;

    move-result-object v1

    return-object v1
.end method

.method private fillFromSelection(III)Landroid/view/View;
    .locals 14
    .param p1, "selectedTop"    # I
    .param p2, "childrenTop"    # I
    .param p3, "childrenBottom"    # I

    .prologue
    .line 705
    invoke-virtual {p0}, Landroid/widget/GridView;->getVerticalFadingEdgeLength()I

    move-result v2

    .line 706
    .local v2, "fadingEdgeLength":I
    iget v9, p0, Landroid/widget/GridView;->mSelectedPosition:I

    .line 707
    .local v9, "selectedPosition":I
    iget v4, p0, Landroid/widget/GridView;->mNumColumns:I

    .line 708
    .local v4, "numColumns":I
    iget v11, p0, Landroid/widget/GridView;->mVerticalSpacing:I

    .line 711
    .local v11, "verticalSpacing":I
    const/4 v6, -0x1

    .line 713
    .local v6, "rowEnd":I
    iget-boolean v12, p0, Landroid/widget/GridView;->mStackFromBottom:Z

    if-nez v12, :cond_0

    .line 714
    rem-int v12, v9, v4

    sub-int v7, v9, v12

    .line 725
    .local v7, "rowStart":I
    :goto_0
    move/from16 v0, p2

    invoke-direct {p0, v0, v2, v7}, Landroid/widget/GridView;->getTopSelectionPixel(III)I

    move-result v10

    .line 726
    .local v10, "topSelectionPixel":I
    move/from16 v0, p3

    invoke-direct {p0, v0, v2, v4, v7}, Landroid/widget/GridView;->getBottomSelectionPixel(IIII)I

    move-result v1

    .line 729
    .local v1, "bottomSelectionPixel":I
    iget-boolean v12, p0, Landroid/widget/GridView;->mStackFromBottom:Z

    if-eqz v12, :cond_1

    move v12, v6

    :goto_1
    const/4 v13, 0x1

    invoke-direct {p0, v12, p1, v13}, Landroid/widget/GridView;->makeRow(IIZ)Landroid/view/View;

    move-result-object v8

    .line 731
    .local v8, "sel":Landroid/view/View;
    iput v7, p0, Landroid/widget/GridView;->mFirstPosition:I

    .line 733
    iget-object v5, p0, Landroid/widget/GridView;->mReferenceView:Landroid/view/View;

    .line 734
    .local v5, "referenceView":Landroid/view/View;
    invoke-direct {p0, v5, v10, v1}, Landroid/widget/GridView;->adjustForTopFadingEdge(Landroid/view/View;II)V

    .line 735
    invoke-direct {p0, v5, v10, v1}, Landroid/widget/GridView;->adjustForBottomFadingEdge(Landroid/view/View;II)V

    .line 737
    iget-boolean v12, p0, Landroid/widget/GridView;->mStackFromBottom:Z

    if-nez v12, :cond_2

    .line 738
    sub-int v12, v7, v4

    invoke-virtual {v5}, Landroid/view/View;->getTop()I

    move-result v13

    sub-int/2addr v13, v11

    invoke-direct {p0, v12, v13}, Landroid/widget/GridView;->fillUp(II)Landroid/view/View;

    .line 739
    invoke-direct {p0}, Landroid/widget/GridView;->adjustViewsUpOrDown()V

    .line 740
    add-int v12, v7, v4

    invoke-virtual {v5}, Landroid/view/View;->getBottom()I

    move-result v13

    add-int/2addr v13, v11

    invoke-direct {p0, v12, v13}, Landroid/widget/GridView;->fillDown(II)Landroid/view/View;

    .line 748
    :goto_2
    return-object v8

    .line 716
    .end local v1    # "bottomSelectionPixel":I
    .end local v5    # "referenceView":Landroid/view/View;
    .end local v7    # "rowStart":I
    .end local v8    # "sel":Landroid/view/View;
    .end local v10    # "topSelectionPixel":I
    :cond_0
    iget v12, p0, Landroid/widget/GridView;->mItemCount:I

    add-int/lit8 v12, v12, -0x1

    sub-int v3, v12, v9

    .line 718
    .local v3, "invertedSelection":I
    iget v12, p0, Landroid/widget/GridView;->mItemCount:I

    add-int/lit8 v12, v12, -0x1

    rem-int v13, v3, v4

    sub-int v13, v3, v13

    sub-int v6, v12, v13

    .line 719
    const/4 v12, 0x0

    sub-int v13, v6, v4

    add-int/lit8 v13, v13, 0x1

    invoke-static {v12, v13}, Ljava/lang/Math;->max(II)I

    move-result v7

    .restart local v7    # "rowStart":I
    goto :goto_0

    .end local v3    # "invertedSelection":I
    .restart local v1    # "bottomSelectionPixel":I
    .restart local v10    # "topSelectionPixel":I
    :cond_1
    move v12, v7

    .line 729
    goto :goto_1

    .line 742
    .restart local v5    # "referenceView":Landroid/view/View;
    .restart local v8    # "sel":Landroid/view/View;
    :cond_2
    add-int v12, v6, v4

    invoke-virtual {v5}, Landroid/view/View;->getBottom()I

    move-result v13

    add-int/2addr v13, v11

    invoke-direct {p0, v12, v13}, Landroid/widget/GridView;->fillDown(II)Landroid/view/View;

    .line 743
    invoke-direct {p0}, Landroid/widget/GridView;->adjustViewsUpOrDown()V

    .line 744
    add-int/lit8 v12, v7, -0x1

    invoke-virtual {v5}, Landroid/view/View;->getTop()I

    move-result v13

    sub-int/2addr v13, v11

    invoke-direct {p0, v12, v13}, Landroid/widget/GridView;->fillUp(II)Landroid/view/View;

    goto :goto_2
.end method

.method private fillFromTop(I)Landroid/view/View;
    .locals 3
    .param p1, "nextTop"    # I

    .prologue
    .line 433
    iget v0, p0, Landroid/widget/GridView;->mFirstPosition:I

    iget v1, p0, Landroid/widget/GridView;->mSelectedPosition:I

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    iput v0, p0, Landroid/widget/GridView;->mFirstPosition:I

    .line 434
    iget v0, p0, Landroid/widget/GridView;->mFirstPosition:I

    iget v1, p0, Landroid/widget/GridView;->mItemCount:I

    add-int/lit8 v1, v1, -0x1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    iput v0, p0, Landroid/widget/GridView;->mFirstPosition:I

    .line 435
    iget v0, p0, Landroid/widget/GridView;->mFirstPosition:I

    if-gez v0, :cond_0

    .line 436
    const/4 v0, 0x0

    iput v0, p0, Landroid/widget/GridView;->mFirstPosition:I

    .line 438
    :cond_0
    iget v0, p0, Landroid/widget/GridView;->mFirstPosition:I

    iget v1, p0, Landroid/widget/GridView;->mFirstPosition:I

    iget v2, p0, Landroid/widget/GridView;->mNumColumns:I

    rem-int/2addr v1, v2

    sub-int/2addr v0, v1

    iput v0, p0, Landroid/widget/GridView;->mFirstPosition:I

    .line 439
    iget v0, p0, Landroid/widget/GridView;->mFirstPosition:I

    invoke-direct {p0, v0, p1}, Landroid/widget/GridView;->fillDown(II)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method private fillSelection(II)Landroid/view/View;
    .locals 15
    .param p1, "childrenTop"    # I
    .param p2, "childrenBottom"    # I

    .prologue
    .line 453
    invoke-virtual {p0}, Landroid/widget/GridView;->reconcileSelectedPosition()I

    move-result v10

    .line 454
    .local v10, "selectedPosition":I
    iget v4, p0, Landroid/widget/GridView;->mNumColumns:I

    .line 455
    .local v4, "numColumns":I
    iget v12, p0, Landroid/widget/GridView;->mVerticalSpacing:I

    .line 458
    .local v12, "verticalSpacing":I
    const/4 v7, -0x1

    .line 460
    .local v7, "rowEnd":I
    iget-boolean v13, p0, Landroid/widget/GridView;->mStackFromBottom:Z

    if-nez v13, :cond_0

    .line 461
    rem-int v13, v10, v4

    sub-int v8, v10, v13

    .line 469
    .local v8, "rowStart":I
    :goto_0
    invoke-virtual {p0}, Landroid/widget/GridView;->getVerticalFadingEdgeLength()I

    move-result v2

    .line 470
    .local v2, "fadingEdgeLength":I
    move/from16 v0, p1

    invoke-direct {p0, v0, v2, v8}, Landroid/widget/GridView;->getTopSelectionPixel(III)I

    move-result v11

    .line 472
    .local v11, "topSelectionPixel":I
    iget-boolean v13, p0, Landroid/widget/GridView;->mStackFromBottom:Z

    if-eqz v13, :cond_1

    move v13, v7

    :goto_1
    const/4 v14, 0x1

    invoke-direct {p0, v13, v11, v14}, Landroid/widget/GridView;->makeRow(IIZ)Landroid/view/View;

    move-result-object v9

    .line 473
    .local v9, "sel":Landroid/view/View;
    iput v8, p0, Landroid/widget/GridView;->mFirstPosition:I

    .line 475
    iget-object v6, p0, Landroid/widget/GridView;->mReferenceView:Landroid/view/View;

    .line 477
    .local v6, "referenceView":Landroid/view/View;
    iget-boolean v13, p0, Landroid/widget/GridView;->mStackFromBottom:Z

    if-nez v13, :cond_2

    .line 478
    add-int v13, v8, v4

    invoke-virtual {v6}, Landroid/view/View;->getBottom()I

    move-result v14

    add-int/2addr v14, v12

    invoke-direct {p0, v13, v14}, Landroid/widget/GridView;->fillDown(II)Landroid/view/View;

    .line 479
    move/from16 v0, p2

    invoke-direct {p0, v0}, Landroid/widget/GridView;->pinToBottom(I)V

    .line 480
    sub-int v13, v8, v4

    invoke-virtual {v6}, Landroid/view/View;->getTop()I

    move-result v14

    sub-int/2addr v14, v12

    invoke-direct {p0, v13, v14}, Landroid/widget/GridView;->fillUp(II)Landroid/view/View;

    .line 481
    invoke-direct {p0}, Landroid/widget/GridView;->adjustViewsUpOrDown()V

    .line 493
    :goto_2
    return-object v9

    .line 463
    .end local v2    # "fadingEdgeLength":I
    .end local v6    # "referenceView":Landroid/view/View;
    .end local v8    # "rowStart":I
    .end local v9    # "sel":Landroid/view/View;
    .end local v11    # "topSelectionPixel":I
    :cond_0
    iget v13, p0, Landroid/widget/GridView;->mItemCount:I

    add-int/lit8 v13, v13, -0x1

    sub-int v3, v13, v10

    .line 465
    .local v3, "invertedSelection":I
    iget v13, p0, Landroid/widget/GridView;->mItemCount:I

    add-int/lit8 v13, v13, -0x1

    rem-int v14, v3, v4

    sub-int v14, v3, v14

    sub-int v7, v13, v14

    .line 466
    const/4 v13, 0x0

    sub-int v14, v7, v4

    add-int/lit8 v14, v14, 0x1

    invoke-static {v13, v14}, Ljava/lang/Math;->max(II)I

    move-result v8

    .restart local v8    # "rowStart":I
    goto :goto_0

    .end local v3    # "invertedSelection":I
    .restart local v2    # "fadingEdgeLength":I
    .restart local v11    # "topSelectionPixel":I
    :cond_1
    move v13, v8

    .line 472
    goto :goto_1

    .line 483
    .restart local v6    # "referenceView":Landroid/view/View;
    .restart local v9    # "sel":Landroid/view/View;
    :cond_2
    move/from16 v0, p2

    invoke-direct {p0, v0, v2, v4, v8}, Landroid/widget/GridView;->getBottomSelectionPixel(IIII)I

    move-result v1

    .line 485
    .local v1, "bottomSelectionPixel":I
    invoke-virtual {v6}, Landroid/view/View;->getBottom()I

    move-result v13

    sub-int v5, v1, v13

    .line 486
    .local v5, "offset":I
    invoke-virtual {p0, v5}, Landroid/widget/GridView;->offsetChildrenTopAndBottom(I)V

    .line 487
    add-int/lit8 v13, v8, -0x1

    invoke-virtual {v6}, Landroid/view/View;->getTop()I

    move-result v14

    sub-int/2addr v14, v12

    invoke-direct {p0, v13, v14}, Landroid/widget/GridView;->fillUp(II)Landroid/view/View;

    .line 488
    invoke-direct/range {p0 .. p1}, Landroid/widget/GridView;->pinToTop(I)V

    .line 489
    add-int v13, v7, v4

    invoke-virtual {v6}, Landroid/view/View;->getBottom()I

    move-result v14

    add-int/2addr v14, v12

    invoke-direct {p0, v13, v14}, Landroid/widget/GridView;->fillDown(II)Landroid/view/View;

    .line 490
    invoke-direct {p0}, Landroid/widget/GridView;->adjustViewsUpOrDown()V

    goto :goto_2
.end method

.method private fillSpecific(II)Landroid/view/View;
    .locals 12
    .param p1, "position"    # I
    .param p2, "top"    # I

    .prologue
    .line 551
    iget v6, p0, Landroid/widget/GridView;->mNumColumns:I

    .line 554
    .local v6, "numColumns":I
    const/4 v4, -0x1

    .line 556
    .local v4, "motionRowEnd":I
    iget-boolean v10, p0, Landroid/widget/GridView;->mStackFromBottom:Z

    if-nez v10, :cond_1

    .line 557
    rem-int v10, p1, v6

    sub-int v5, p1, v10

    .line 565
    .local v5, "motionRowStart":I
    :goto_0
    iget-boolean v10, p0, Landroid/widget/GridView;->mStackFromBottom:Z

    if-eqz v10, :cond_2

    move v10, v4

    :goto_1
    const/4 v11, 0x1

    invoke-direct {p0, v10, p2, v11}, Landroid/widget/GridView;->makeRow(IIZ)Landroid/view/View;

    move-result-object v8

    .line 568
    .local v8, "temp":Landroid/view/View;
    iput v5, p0, Landroid/widget/GridView;->mFirstPosition:I

    .line 570
    iget-object v7, p0, Landroid/widget/GridView;->mReferenceView:Landroid/view/View;

    .line 572
    .local v7, "referenceView":Landroid/view/View;
    if-nez v7, :cond_3

    .line 573
    const/4 v8, 0x0

    .line 606
    .end local v8    # "temp":Landroid/view/View;
    :cond_0
    :goto_2
    return-object v8

    .line 559
    .end local v5    # "motionRowStart":I
    .end local v7    # "referenceView":Landroid/view/View;
    :cond_1
    iget v10, p0, Landroid/widget/GridView;->mItemCount:I

    add-int/lit8 v10, v10, -0x1

    sub-int v3, v10, p1

    .line 561
    .local v3, "invertedSelection":I
    iget v10, p0, Landroid/widget/GridView;->mItemCount:I

    add-int/lit8 v10, v10, -0x1

    rem-int v11, v3, v6

    sub-int v11, v3, v11

    sub-int v4, v10, v11

    .line 562
    const/4 v10, 0x0

    sub-int v11, v4, v6

    add-int/lit8 v11, v11, 0x1

    invoke-static {v10, v11}, Ljava/lang/Math;->max(II)I

    move-result v5

    .restart local v5    # "motionRowStart":I
    goto :goto_0

    .end local v3    # "invertedSelection":I
    :cond_2
    move v10, v5

    .line 565
    goto :goto_1

    .line 576
    .restart local v7    # "referenceView":Landroid/view/View;
    .restart local v8    # "temp":Landroid/view/View;
    :cond_3
    iget v9, p0, Landroid/widget/GridView;->mVerticalSpacing:I

    .line 581
    .local v9, "verticalSpacing":I
    iget-boolean v10, p0, Landroid/widget/GridView;->mStackFromBottom:Z

    if-nez v10, :cond_5

    .line 582
    sub-int v10, v5, v6

    invoke-virtual {v7}, Landroid/view/View;->getTop()I

    move-result v11

    sub-int/2addr v11, v9

    invoke-direct {p0, v10, v11}, Landroid/widget/GridView;->fillUp(II)Landroid/view/View;

    move-result-object v0

    .line 583
    .local v0, "above":Landroid/view/View;
    invoke-direct {p0}, Landroid/widget/GridView;->adjustViewsUpOrDown()V

    .line 584
    add-int v10, v5, v6

    invoke-virtual {v7}, Landroid/view/View;->getBottom()I

    move-result v11

    add-int/2addr v11, v9

    invoke-direct {p0, v10, v11}, Landroid/widget/GridView;->fillDown(II)Landroid/view/View;

    move-result-object v1

    .line 586
    .local v1, "below":Landroid/view/View;
    invoke-virtual {p0}, Landroid/widget/GridView;->getChildCount()I

    move-result v2

    .line 587
    .local v2, "childCount":I
    if-lez v2, :cond_4

    .line 588
    invoke-direct {p0, v6, v9, v2}, Landroid/widget/GridView;->correctTooHigh(III)V

    .line 601
    :cond_4
    :goto_3
    if-nez v8, :cond_0

    .line 603
    if-eqz v0, :cond_6

    move-object v8, v0

    .line 604
    goto :goto_2

    .line 591
    .end local v0    # "above":Landroid/view/View;
    .end local v1    # "below":Landroid/view/View;
    .end local v2    # "childCount":I
    :cond_5
    add-int v10, v4, v6

    invoke-virtual {v7}, Landroid/view/View;->getBottom()I

    move-result v11

    add-int/2addr v11, v9

    invoke-direct {p0, v10, v11}, Landroid/widget/GridView;->fillDown(II)Landroid/view/View;

    move-result-object v1

    .line 592
    .restart local v1    # "below":Landroid/view/View;
    invoke-direct {p0}, Landroid/widget/GridView;->adjustViewsUpOrDown()V

    .line 593
    add-int/lit8 v10, v5, -0x1

    invoke-virtual {v7}, Landroid/view/View;->getTop()I

    move-result v11

    sub-int/2addr v11, v9

    invoke-direct {p0, v10, v11}, Landroid/widget/GridView;->fillUp(II)Landroid/view/View;

    move-result-object v0

    .line 595
    .restart local v0    # "above":Landroid/view/View;
    invoke-virtual {p0}, Landroid/widget/GridView;->getChildCount()I

    move-result v2

    .line 596
    .restart local v2    # "childCount":I
    if-lez v2, :cond_4

    .line 597
    invoke-direct {p0, v6, v9, v2}, Landroid/widget/GridView;->correctTooLow(III)V

    goto :goto_3

    :cond_6
    move-object v8, v1

    .line 606
    goto :goto_2
.end method

.method private fillUp(II)Landroid/view/View;
    .locals 6
    .param p1, "pos"    # I
    .param p2, "nextBottom"    # I

    .prologue
    const/4 v5, 0x0

    .line 395
    const/4 v1, 0x0

    .line 397
    .local v1, "selectedView":Landroid/view/View;
    const/4 v0, 0x0

    .line 398
    .local v0, "end":I
    iget v3, p0, Landroid/widget/GridView;->mGroupFlags:I

    and-int/lit8 v3, v3, 0x22

    const/16 v4, 0x22

    if-ne v3, v4, :cond_0

    .line 399
    iget-object v3, p0, Landroid/widget/GridView;->mListPadding:Landroid/graphics/Rect;

    iget v0, v3, Landroid/graphics/Rect;->top:I

    .line 402
    :cond_0
    :goto_0
    if-le p2, v0, :cond_2

    if-ltz p1, :cond_2

    .line 404
    invoke-direct {p0, p1, p2, v5}, Landroid/widget/GridView;->makeRow(IIZ)Landroid/view/View;

    move-result-object v2

    .line 405
    .local v2, "temp":Landroid/view/View;
    if-eqz v2, :cond_1

    .line 406
    move-object v1, v2

    .line 409
    :cond_1
    iget-object v3, p0, Landroid/widget/GridView;->mReferenceView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getTop()I

    move-result v3

    iget v4, p0, Landroid/widget/GridView;->mVerticalSpacing:I

    sub-int p2, v3, v4

    .line 411
    iput p1, p0, Landroid/widget/GridView;->mFirstPosition:I

    .line 413
    iget v3, p0, Landroid/widget/GridView;->mNumColumns:I

    sub-int/2addr p1, v3

    .line 414
    goto :goto_0

    .line 416
    .end local v2    # "temp":Landroid/view/View;
    :cond_2
    iget-boolean v3, p0, Landroid/widget/GridView;->mStackFromBottom:Z

    if-eqz v3, :cond_3

    .line 417
    add-int/lit8 v3, p1, 0x1

    invoke-static {v5, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    iput v3, p0, Landroid/widget/GridView;->mFirstPosition:I

    .line 420
    :cond_3
    iget v3, p0, Landroid/widget/GridView;->mFirstPosition:I

    iget v4, p0, Landroid/widget/GridView;->mFirstPosition:I

    invoke-virtual {p0}, Landroid/widget/GridView;->getChildCount()I

    move-result v5

    add-int/2addr v4, v5

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {p0, v3, v4}, Landroid/widget/GridView;->setVisibleRangeHint(II)V

    .line 421
    return-object v1
.end method

.method private getBottomSelectionPixel(IIII)I
    .locals 3
    .param p1, "childrenBottom"    # I
    .param p2, "fadingEdgeLength"    # I
    .param p3, "numColumns"    # I
    .param p4, "rowStart"    # I

    .prologue
    .line 763
    move v0, p1

    .line 764
    .local v0, "bottomSelectionPixel":I
    add-int v1, p4, p3

    add-int/lit8 v1, v1, -0x1

    iget v2, p0, Landroid/widget/GridView;->mItemCount:I

    add-int/lit8 v2, v2, -0x1

    if-ge v1, v2, :cond_0

    .line 765
    sub-int/2addr v0, p2

    .line 767
    :cond_0
    return v0
.end method

.method private getTopSelectionPixel(III)I
    .locals 1
    .param p1, "childrenTop"    # I
    .param p2, "fadingEdgeLength"    # I
    .param p3, "rowStart"    # I

    .prologue
    .line 780
    move v0, p1

    .line 781
    .local v0, "topSelectionPixel":I
    if-lez p3, :cond_0

    .line 782
    add-int/2addr v0, p2

    .line 784
    :cond_0
    return v0
.end method

.method private isCandidateSelection(II)Z
    .locals 8
    .param p1, "childIndex"    # I
    .param p2, "direction"    # I

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 1997
    invoke-virtual {p0}, Landroid/widget/GridView;->getChildCount()I

    move-result v0

    .line 1998
    .local v0, "count":I
    add-int/lit8 v6, v0, -0x1

    sub-int v1, v6, p1

    .line 2003
    .local v1, "invertedIndex":I
    iget-boolean v6, p0, Landroid/widget/GridView;->mStackFromBottom:Z

    if-nez v6, :cond_0

    .line 2004
    iget v6, p0, Landroid/widget/GridView;->mNumColumns:I

    rem-int v6, p1, v6

    sub-int v3, p1, v6

    .line 2005
    .local v3, "rowStart":I
    iget v6, p0, Landroid/widget/GridView;->mNumColumns:I

    add-int/2addr v6, v3

    add-int/lit8 v6, v6, -0x1

    invoke-static {v6, v0}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 2011
    .local v2, "rowEnd":I
    :goto_0
    sparse-switch p2, :sswitch_data_0

    .line 2032
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "direction must be one of {FOCUS_UP, FOCUS_DOWN, FOCUS_LEFT, FOCUS_RIGHT, FOCUS_FORWARD, FOCUS_BACKWARD}."

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 2007
    .end local v2    # "rowEnd":I
    .end local v3    # "rowStart":I
    :cond_0
    add-int/lit8 v6, v0, -0x1

    iget v7, p0, Landroid/widget/GridView;->mNumColumns:I

    rem-int v7, v1, v7

    sub-int v7, v1, v7

    sub-int v2, v6, v7

    .line 2008
    .restart local v2    # "rowEnd":I
    iget v6, p0, Landroid/widget/GridView;->mNumColumns:I

    sub-int v6, v2, v6

    add-int/lit8 v6, v6, 0x1

    invoke-static {v5, v6}, Ljava/lang/Math;->max(II)I

    move-result v3

    .restart local v3    # "rowStart":I
    goto :goto_0

    .line 2015
    :sswitch_0
    if-ne p1, v3, :cond_2

    .line 2030
    :cond_1
    :goto_1
    return v4

    :cond_2
    move v4, v5

    .line 2015
    goto :goto_1

    .line 2018
    :sswitch_1
    if-eqz v3, :cond_1

    move v4, v5

    goto :goto_1

    .line 2021
    :sswitch_2
    if-eq p1, v2, :cond_1

    move v4, v5

    goto :goto_1

    .line 2024
    :sswitch_3
    add-int/lit8 v6, v0, -0x1

    if-eq v2, v6, :cond_1

    move v4, v5

    goto :goto_1

    .line 2027
    :sswitch_4
    if-ne p1, v3, :cond_3

    if-eqz v3, :cond_1

    :cond_3
    move v4, v5

    goto :goto_1

    .line 2030
    :sswitch_5
    if-ne p1, v2, :cond_4

    add-int/lit8 v6, v0, -0x1

    if-eq v2, v6, :cond_1

    :cond_4
    move v4, v5

    goto :goto_1

    .line 2011
    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_5
        0x2 -> :sswitch_4
        0x11 -> :sswitch_2
        0x21 -> :sswitch_3
        0x42 -> :sswitch_0
        0x82 -> :sswitch_1
    .end sparse-switch
.end method

.method private makeAndAddView(IIZIZI)Landroid/view/View;
    .locals 10
    .param p1, "position"    # I
    .param p2, "y"    # I
    .param p3, "flow"    # Z
    .param p4, "childrenLeft"    # I
    .param p5, "selected"    # Z
    .param p6, "where"    # I

    .prologue
    .line 1422
    iget-boolean v0, p0, Landroid/widget/GridView;->mDataChanged:Z

    if-nez v0, :cond_0

    .line 1424
    iget-object v0, p0, Landroid/widget/GridView;->mRecycler:Landroid/widget/AbsListView$RecycleBin;

    invoke-virtual {v0, p1}, Landroid/widget/AbsListView$RecycleBin;->getActiveView(I)Landroid/view/View;

    move-result-object v1

    .line 1425
    .local v1, "child":Landroid/view/View;
    if-eqz v1, :cond_0

    .line 1428
    const/4 v7, 0x1

    move-object v0, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move/from16 v8, p6

    invoke-direct/range {v0 .. v8}, Landroid/widget/GridView;->setupChild(Landroid/view/View;IIZIZZI)V

    move-object v9, v1

    .line 1440
    .end local v1    # "child":Landroid/view/View;
    .local v9, "child":Landroid/view/View;
    :goto_0
    return-object v9

    .line 1435
    .end local v9    # "child":Landroid/view/View;
    :cond_0
    iget-object v0, p0, Landroid/widget/GridView;->mIsScrap:[Z

    invoke-virtual {p0, p1, v0}, Landroid/widget/GridView;->obtainView(I[Z)Landroid/view/View;

    move-result-object v1

    .line 1438
    .restart local v1    # "child":Landroid/view/View;
    iget-object v0, p0, Landroid/widget/GridView;->mIsScrap:[Z

    const/4 v2, 0x0

    aget-boolean v7, v0, v2

    move-object v0, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move/from16 v8, p6

    invoke-direct/range {v0 .. v8}, Landroid/widget/GridView;->setupChild(Landroid/view/View;IIZIZZI)V

    move-object v9, v1

    .line 1440
    .end local v1    # "child":Landroid/view/View;
    .restart local v9    # "child":Landroid/view/View;
    goto :goto_0
.end method

.method private makeRow(IIZ)Landroid/view/View;
    .locals 19
    .param p1, "startPos"    # I
    .param p2, "y"    # I
    .param p3, "flow"    # Z

    .prologue
    .line 321
    move-object/from16 v0, p0

    iget v9, v0, Landroid/widget/GridView;->mColumnWidth:I

    .line 322
    .local v9, "columnWidth":I
    move-object/from16 v0, p0

    iget v12, v0, Landroid/widget/GridView;->mHorizontalSpacing:I

    .line 324
    .local v12, "horizontalSpacing":I
    invoke-virtual/range {p0 .. p0}, Landroid/widget/GridView;->isLayoutRtl()Z

    move-result v14

    .line 329
    .local v14, "isLayoutRtl":Z
    if-eqz v14, :cond_5

    .line 330
    invoke-virtual/range {p0 .. p0}, Landroid/widget/GridView;->getWidth()I

    move-result v1

    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/widget/GridView;->mListPadding:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->right:I

    sub-int/2addr v1, v3

    sub-int v3, v1, v9

    move-object/from16 v0, p0

    iget v1, v0, Landroid/widget/GridView;->mStretchMode:I

    const/4 v4, 0x3

    if-ne v1, v4, :cond_4

    move v1, v12

    :goto_0
    sub-int v5, v3, v1

    .line 337
    .local v5, "nextLeft":I
    :goto_1
    move-object/from16 v0, p0

    iget-boolean v1, v0, Landroid/widget/GridView;->mStackFromBottom:Z

    if-nez v1, :cond_7

    .line 338
    move-object/from16 v0, p0

    iget v1, v0, Landroid/widget/GridView;->mNumColumns:I

    add-int v1, v1, p1

    move-object/from16 v0, p0

    iget v3, v0, Landroid/widget/GridView;->mItemCount:I

    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    move-result v15

    .line 349
    .local v15, "last":I
    :cond_0
    :goto_2
    const/16 v18, 0x0

    .line 351
    .local v18, "selectedView":Landroid/view/View;
    invoke-virtual/range {p0 .. p0}, Landroid/widget/GridView;->shouldShowSelector()Z

    move-result v11

    .line 352
    .local v11, "hasFocus":Z
    invoke-virtual/range {p0 .. p0}, Landroid/widget/GridView;->touchModeDrawsInPressedState()Z

    move-result v13

    .line 353
    .local v13, "inClick":Z
    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mSelectedPosition:I

    move/from16 v17, v0

    .line 355
    .local v17, "selectedPosition":I
    const/4 v8, 0x0

    .line 356
    .local v8, "child":Landroid/view/View;
    if-eqz v14, :cond_9

    const/16 v16, -0x1

    .line 357
    .local v16, "nextChildDir":I
    :goto_3
    move/from16 v2, p1

    .local v2, "pos":I
    :goto_4
    if-ge v2, v15, :cond_c

    .line 359
    move/from16 v0, v17

    if-ne v2, v0, :cond_a

    const/4 v6, 0x1

    .line 362
    .local v6, "selected":Z
    :goto_5
    if-eqz p3, :cond_b

    const/4 v7, -0x1

    .local v7, "where":I
    :goto_6
    move-object/from16 v1, p0

    move/from16 v3, p2

    move/from16 v4, p3

    .line 363
    invoke-direct/range {v1 .. v7}, Landroid/widget/GridView;->makeAndAddView(IIZIZI)Landroid/view/View;

    move-result-object v8

    .line 365
    mul-int v1, v16, v9

    add-int/2addr v5, v1

    .line 366
    add-int/lit8 v1, v15, -0x1

    if-ge v2, v1, :cond_1

    .line 367
    mul-int v1, v16, v12

    add-int/2addr v5, v1

    .line 370
    :cond_1
    if-eqz v6, :cond_3

    if-nez v11, :cond_2

    if-eqz v13, :cond_3

    .line 371
    :cond_2
    move-object/from16 v18, v8

    .line 357
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 330
    .end local v2    # "pos":I
    .end local v5    # "nextLeft":I
    .end local v6    # "selected":Z
    .end local v7    # "where":I
    .end local v8    # "child":Landroid/view/View;
    .end local v11    # "hasFocus":Z
    .end local v13    # "inClick":Z
    .end local v15    # "last":I
    .end local v16    # "nextChildDir":I
    .end local v17    # "selectedPosition":I
    .end local v18    # "selectedView":Landroid/view/View;
    :cond_4
    const/4 v1, 0x0

    goto :goto_0

    .line 333
    :cond_5
    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/widget/GridView;->mListPadding:Landroid/graphics/Rect;

    iget v3, v1, Landroid/graphics/Rect;->left:I

    move-object/from16 v0, p0

    iget v1, v0, Landroid/widget/GridView;->mStretchMode:I

    const/4 v4, 0x3

    if-ne v1, v4, :cond_6

    move v1, v12

    :goto_7
    add-int v5, v3, v1

    .restart local v5    # "nextLeft":I
    goto :goto_1

    .end local v5    # "nextLeft":I
    :cond_6
    const/4 v1, 0x0

    goto :goto_7

    .line 340
    .restart local v5    # "nextLeft":I
    :cond_7
    add-int/lit8 v15, p1, 0x1

    .line 341
    .restart local v15    # "last":I
    const/4 v1, 0x0

    move-object/from16 v0, p0

    iget v3, v0, Landroid/widget/GridView;->mNumColumns:I

    sub-int v3, p1, v3

    add-int/lit8 v3, v3, 0x1

    invoke-static {v1, v3}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 343
    sub-int v1, v15, p1

    move-object/from16 v0, p0

    iget v3, v0, Landroid/widget/GridView;->mNumColumns:I

    if-ge v1, v3, :cond_0

    .line 344
    move-object/from16 v0, p0

    iget v1, v0, Landroid/widget/GridView;->mNumColumns:I

    sub-int v3, v15, p1

    sub-int/2addr v1, v3

    add-int v3, v9, v12

    mul-int v10, v1, v3

    .line 345
    .local v10, "deltaLeft":I
    if-eqz v14, :cond_8

    const/4 v1, -0x1

    :goto_8
    mul-int/2addr v1, v10

    add-int/2addr v5, v1

    goto :goto_2

    :cond_8
    const/4 v1, 0x1

    goto :goto_8

    .line 356
    .end local v10    # "deltaLeft":I
    .restart local v8    # "child":Landroid/view/View;
    .restart local v11    # "hasFocus":Z
    .restart local v13    # "inClick":Z
    .restart local v17    # "selectedPosition":I
    .restart local v18    # "selectedView":Landroid/view/View;
    :cond_9
    const/16 v16, 0x1

    goto :goto_3

    .line 359
    .restart local v2    # "pos":I
    .restart local v16    # "nextChildDir":I
    :cond_a
    const/4 v6, 0x0

    goto :goto_5

    .line 362
    .restart local v6    # "selected":Z
    :cond_b
    sub-int v7, v2, p1

    goto :goto_6

    .line 375
    .end local v6    # "selected":Z
    :cond_c
    move-object/from16 v0, p0

    iput-object v8, v0, Landroid/widget/GridView;->mReferenceView:Landroid/view/View;

    .line 377
    if-eqz v18, :cond_d

    .line 378
    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/widget/GridView;->mReferenceView:Landroid/view/View;

    move-object/from16 v0, p0

    iput-object v1, v0, Landroid/widget/GridView;->mReferenceViewInSelectedRow:Landroid/view/View;

    .line 381
    :cond_d
    return-object v18
.end method

.method private moveSelection(III)Landroid/view/View;
    .locals 22
    .param p1, "delta"    # I
    .param p2, "childrenTop"    # I
    .param p3, "childrenBottom"    # I

    .prologue
    .line 877
    invoke-virtual/range {p0 .. p0}, Landroid/widget/GridView;->getVerticalFadingEdgeLength()I

    move-result v5

    .line 878
    .local v5, "fadingEdgeLength":I
    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mSelectedPosition:I

    move/from16 v16, v0

    .line 879
    .local v16, "selectedPosition":I
    move-object/from16 v0, p0

    iget v7, v0, Landroid/widget/GridView;->mNumColumns:I

    .line 880
    .local v7, "numColumns":I
    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mVerticalSpacing:I

    move/from16 v18, v0

    .line 884
    .local v18, "verticalSpacing":I
    const/4 v13, -0x1

    .line 886
    .local v13, "rowEnd":I
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/widget/GridView;->mStackFromBottom:Z

    move/from16 v19, v0

    if-nez v19, :cond_0

    .line 887
    sub-int v19, v16, p1

    sub-int v20, v16, p1

    rem-int v20, v20, v7

    sub-int v9, v19, v20

    .line 889
    .local v9, "oldRowStart":I
    rem-int v19, v16, v7

    sub-int v14, v16, v19

    .line 901
    .local v14, "rowStart":I
    :goto_0
    sub-int v12, v14, v9

    .line 903
    .local v12, "rowDelta":I
    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-direct {v0, v1, v5, v14}, Landroid/widget/GridView;->getTopSelectionPixel(III)I

    move-result v17

    .line 904
    .local v17, "topSelectionPixel":I
    move-object/from16 v0, p0

    move/from16 v1, p3

    invoke-direct {v0, v1, v5, v7, v14}, Landroid/widget/GridView;->getBottomSelectionPixel(IIII)I

    move-result v4

    .line 908
    .local v4, "bottomSelectionPixel":I
    move-object/from16 v0, p0

    iput v14, v0, Landroid/widget/GridView;->mFirstPosition:I

    .line 913
    if-lez v12, :cond_3

    .line 918
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/GridView;->mReferenceViewInSelectedRow:Landroid/view/View;

    move-object/from16 v19, v0

    if-nez v19, :cond_1

    const/4 v8, 0x0

    .line 921
    .local v8, "oldBottom":I
    :goto_1
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/widget/GridView;->mStackFromBottom:Z

    move/from16 v19, v0

    if-eqz v19, :cond_2

    move/from16 v19, v13

    :goto_2
    add-int v20, v8, v18

    const/16 v21, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    move/from16 v3, v21

    invoke-direct {v0, v1, v2, v3}, Landroid/widget/GridView;->makeRow(IIZ)Landroid/view/View;

    move-result-object v15

    .line 922
    .local v15, "sel":Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v11, v0, Landroid/widget/GridView;->mReferenceView:Landroid/view/View;

    .line 924
    .local v11, "referenceView":Landroid/view/View;
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v0, v11, v1, v4}, Landroid/widget/GridView;->adjustForBottomFadingEdge(Landroid/view/View;II)V

    .line 947
    .end local v8    # "oldBottom":I
    :goto_3
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/widget/GridView;->mStackFromBottom:Z

    move/from16 v19, v0

    if-nez v19, :cond_9

    .line 948
    sub-int v19, v14, v7

    invoke-virtual {v11}, Landroid/view/View;->getTop()I

    move-result v20

    sub-int v20, v20, v18

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-direct {v0, v1, v2}, Landroid/widget/GridView;->fillUp(II)Landroid/view/View;

    .line 949
    invoke-direct/range {p0 .. p0}, Landroid/widget/GridView;->adjustViewsUpOrDown()V

    .line 950
    add-int v19, v14, v7

    invoke-virtual {v11}, Landroid/view/View;->getBottom()I

    move-result v20

    add-int v20, v20, v18

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-direct {v0, v1, v2}, Landroid/widget/GridView;->fillDown(II)Landroid/view/View;

    .line 957
    :goto_4
    return-object v15

    .line 891
    .end local v4    # "bottomSelectionPixel":I
    .end local v9    # "oldRowStart":I
    .end local v11    # "referenceView":Landroid/view/View;
    .end local v12    # "rowDelta":I
    .end local v14    # "rowStart":I
    .end local v15    # "sel":Landroid/view/View;
    .end local v17    # "topSelectionPixel":I
    :cond_0
    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mItemCount:I

    move/from16 v19, v0

    add-int/lit8 v19, v19, -0x1

    sub-int v6, v19, v16

    .line 893
    .local v6, "invertedSelection":I
    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mItemCount:I

    move/from16 v19, v0

    add-int/lit8 v19, v19, -0x1

    rem-int v20, v6, v7

    sub-int v20, v6, v20

    sub-int v13, v19, v20

    .line 894
    const/16 v19, 0x0

    sub-int v20, v13, v7

    add-int/lit8 v20, v20, 0x1

    invoke-static/range {v19 .. v20}, Ljava/lang/Math;->max(II)I

    move-result v14

    .line 896
    .restart local v14    # "rowStart":I
    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mItemCount:I

    move/from16 v19, v0

    add-int/lit8 v19, v19, -0x1

    sub-int v20, v16, p1

    sub-int v6, v19, v20

    .line 897
    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mItemCount:I

    move/from16 v19, v0

    add-int/lit8 v19, v19, -0x1

    rem-int v20, v6, v7

    sub-int v20, v6, v20

    sub-int v9, v19, v20

    .line 898
    .restart local v9    # "oldRowStart":I
    const/16 v19, 0x0

    sub-int v20, v9, v7

    add-int/lit8 v20, v20, 0x1

    invoke-static/range {v19 .. v20}, Ljava/lang/Math;->max(II)I

    move-result v9

    goto/16 :goto_0

    .line 918
    .end local v6    # "invertedSelection":I
    .restart local v4    # "bottomSelectionPixel":I
    .restart local v12    # "rowDelta":I
    .restart local v17    # "topSelectionPixel":I
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/GridView;->mReferenceViewInSelectedRow:Landroid/view/View;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Landroid/view/View;->getBottom()I

    move-result v8

    goto/16 :goto_1

    .restart local v8    # "oldBottom":I
    :cond_2
    move/from16 v19, v14

    .line 921
    goto/16 :goto_2

    .line 925
    .end local v8    # "oldBottom":I
    :cond_3
    if-gez v12, :cond_6

    .line 929
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/GridView;->mReferenceViewInSelectedRow:Landroid/view/View;

    move-object/from16 v19, v0

    if-nez v19, :cond_4

    const/4 v10, 0x0

    .line 932
    .local v10, "oldTop":I
    :goto_5
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/widget/GridView;->mStackFromBottom:Z

    move/from16 v19, v0

    if-eqz v19, :cond_5

    move/from16 v19, v13

    :goto_6
    sub-int v20, v10, v18

    const/16 v21, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    move/from16 v3, v21

    invoke-direct {v0, v1, v2, v3}, Landroid/widget/GridView;->makeRow(IIZ)Landroid/view/View;

    move-result-object v15

    .line 933
    .restart local v15    # "sel":Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v11, v0, Landroid/widget/GridView;->mReferenceView:Landroid/view/View;

    .line 935
    .restart local v11    # "referenceView":Landroid/view/View;
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v0, v11, v1, v4}, Landroid/widget/GridView;->adjustForTopFadingEdge(Landroid/view/View;II)V

    goto/16 :goto_3

    .line 929
    .end local v10    # "oldTop":I
    .end local v11    # "referenceView":Landroid/view/View;
    .end local v15    # "sel":Landroid/view/View;
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/GridView;->mReferenceViewInSelectedRow:Landroid/view/View;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Landroid/view/View;->getTop()I

    move-result v10

    goto :goto_5

    .restart local v10    # "oldTop":I
    :cond_5
    move/from16 v19, v14

    .line 932
    goto :goto_6

    .line 940
    .end local v10    # "oldTop":I
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/GridView;->mReferenceViewInSelectedRow:Landroid/view/View;

    move-object/from16 v19, v0

    if-nez v19, :cond_7

    const/4 v10, 0x0

    .line 943
    .restart local v10    # "oldTop":I
    :goto_7
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/widget/GridView;->mStackFromBottom:Z

    move/from16 v19, v0

    if-eqz v19, :cond_8

    move/from16 v19, v13

    :goto_8
    const/16 v20, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-direct {v0, v1, v10, v2}, Landroid/widget/GridView;->makeRow(IIZ)Landroid/view/View;

    move-result-object v15

    .line 944
    .restart local v15    # "sel":Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v11, v0, Landroid/widget/GridView;->mReferenceView:Landroid/view/View;

    .restart local v11    # "referenceView":Landroid/view/View;
    goto/16 :goto_3

    .line 940
    .end local v10    # "oldTop":I
    .end local v11    # "referenceView":Landroid/view/View;
    .end local v15    # "sel":Landroid/view/View;
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/GridView;->mReferenceViewInSelectedRow:Landroid/view/View;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Landroid/view/View;->getTop()I

    move-result v10

    goto :goto_7

    .restart local v10    # "oldTop":I
    :cond_8
    move/from16 v19, v14

    .line 943
    goto :goto_8

    .line 952
    .end local v10    # "oldTop":I
    .restart local v11    # "referenceView":Landroid/view/View;
    .restart local v15    # "sel":Landroid/view/View;
    :cond_9
    add-int v19, v13, v7

    invoke-virtual {v11}, Landroid/view/View;->getBottom()I

    move-result v20

    add-int v20, v20, v18

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-direct {v0, v1, v2}, Landroid/widget/GridView;->fillDown(II)Landroid/view/View;

    .line 953
    invoke-direct/range {p0 .. p0}, Landroid/widget/GridView;->adjustViewsUpOrDown()V

    .line 954
    add-int/lit8 v19, v14, -0x1

    invoke-virtual {v11}, Landroid/view/View;->getTop()I

    move-result v20

    sub-int v20, v20, v18

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-direct {v0, v1, v2}, Landroid/widget/GridView;->fillUp(II)Landroid/view/View;

    goto/16 :goto_4
.end method

.method private pinToBottom(I)V
    .locals 5
    .param p1, "childrenBottom"    # I

    .prologue
    .line 507
    invoke-virtual {p0}, Landroid/widget/GridView;->getChildCount()I

    move-result v1

    .line 508
    .local v1, "count":I
    iget v3, p0, Landroid/widget/GridView;->mFirstPosition:I

    add-int/2addr v3, v1

    iget v4, p0, Landroid/widget/GridView;->mItemCount:I

    if-ne v3, v4, :cond_0

    .line 509
    add-int/lit8 v3, v1, -0x1

    invoke-virtual {p0, v3}, Landroid/widget/GridView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getBottom()I

    move-result v0

    .line 510
    .local v0, "bottom":I
    sub-int v2, p1, v0

    .line 511
    .local v2, "offset":I
    if-lez v2, :cond_0

    .line 512
    invoke-virtual {p0, v2}, Landroid/widget/GridView;->offsetChildrenTopAndBottom(I)V

    .line 515
    .end local v0    # "bottom":I
    .end local v2    # "offset":I
    :cond_0
    return-void
.end method

.method private pinToTop(I)V
    .locals 3
    .param p1, "childrenTop"    # I

    .prologue
    .line 497
    iget v2, p0, Landroid/widget/GridView;->mFirstPosition:I

    if-nez v2, :cond_0

    .line 498
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Landroid/widget/GridView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    move-result v1

    .line 499
    .local v1, "top":I
    sub-int v0, p1, v1

    .line 500
    .local v0, "offset":I
    if-gez v0, :cond_0

    .line 501
    invoke-virtual {p0, v0}, Landroid/widget/GridView;->offsetChildrenTopAndBottom(I)V

    .line 504
    .end local v0    # "offset":I
    .end local v1    # "top":I
    :cond_0
    return-void
.end method

.method private setupChild(Landroid/view/View;IIZIZZI)V
    .locals 26
    .param p1, "child"    # Landroid/view/View;
    .param p2, "position"    # I
    .param p3, "y"    # I
    .param p4, "flow"    # Z
    .param p5, "childrenLeft"    # I
    .param p6, "selected"    # Z
    .param p7, "recycled"    # Z
    .param p8, "where"    # I

    .prologue
    .line 1461
    const-wide/16 v24, 0x8

    const-string v23, "setupGridItem"

    move-wide/from16 v0, v24

    move-object/from16 v2, v23

    invoke-static {v0, v1, v2}, Landroid/os/Trace;->traceBegin(JLjava/lang/String;)V

    .line 1463
    if-eqz p6, :cond_7

    invoke-virtual/range {p0 .. p0}, Landroid/widget/GridView;->shouldShowSelector()Z

    move-result v23

    if-eqz v23, :cond_7

    const/4 v15, 0x1

    .line 1464
    .local v15, "isSelected":Z
    :goto_0
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->isSelected()Z

    move-result v23

    move/from16 v0, v23

    if-eq v15, v0, :cond_8

    const/16 v21, 0x1

    .line 1465
    .local v21, "updateChildSelected":Z
    :goto_1
    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mTouchMode:I

    move/from16 v17, v0

    .line 1466
    .local v17, "mode":I
    if-lez v17, :cond_9

    const/16 v23, 0x3

    move/from16 v0, v17

    move/from16 v1, v23

    if-ge v0, v1, :cond_9

    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mMotionPosition:I

    move/from16 v23, v0

    move/from16 v0, v23

    move/from16 v1, p2

    if-ne v0, v1, :cond_9

    const/4 v14, 0x1

    .line 1468
    .local v14, "isPressed":Z
    :goto_2
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->isPressed()Z

    move-result v23

    move/from16 v0, v23

    if-eq v14, v0, :cond_a

    const/16 v20, 0x1

    .line 1470
    .local v20, "updateChildPressed":Z
    :goto_3
    if-eqz p7, :cond_0

    if-nez v21, :cond_0

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->isLayoutRequested()Z

    move-result v23

    if-eqz v23, :cond_b

    :cond_0
    const/16 v18, 0x1

    .line 1474
    .local v18, "needToMeasure":Z
    :goto_4
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v19

    check-cast v19, Landroid/widget/AbsListView$LayoutParams;

    .line 1475
    .local v19, "p":Landroid/widget/AbsListView$LayoutParams;
    if-nez v19, :cond_1

    .line 1476
    invoke-virtual/range {p0 .. p0}, Landroid/widget/GridView;->generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v19

    .end local v19    # "p":Landroid/widget/AbsListView$LayoutParams;
    check-cast v19, Landroid/widget/AbsListView$LayoutParams;

    .line 1478
    .restart local v19    # "p":Landroid/widget/AbsListView$LayoutParams;
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/GridView;->mAdapter:Landroid/widget/ListAdapter;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    move/from16 v1, p2

    invoke-interface {v0, v1}, Landroid/widget/ListAdapter;->getItemViewType(I)I

    move-result v23

    move/from16 v0, v23

    move-object/from16 v1, v19

    iput v0, v1, Landroid/widget/AbsListView$LayoutParams;->viewType:I

    .line 1480
    if-eqz p7, :cond_c

    move-object/from16 v0, v19

    iget-boolean v0, v0, Landroid/widget/AbsListView$LayoutParams;->forceAdd:Z

    move/from16 v23, v0

    if-nez v23, :cond_c

    .line 1481
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p8

    move-object/from16 v3, v19

    invoke-virtual {v0, v1, v2, v3}, Landroid/widget/GridView;->attachViewToParent(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 1487
    :goto_5
    if-eqz v21, :cond_2

    .line 1488
    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Landroid/view/View;->setSelected(Z)V

    .line 1489
    if-eqz v15, :cond_2

    .line 1490
    invoke-virtual/range {p0 .. p0}, Landroid/widget/GridView;->requestFocus()Z

    .line 1494
    :cond_2
    if-eqz v20, :cond_3

    .line 1495
    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Landroid/view/View;->setPressed(Z)V

    .line 1498
    :cond_3
    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mChoiceMode:I

    move/from16 v23, v0

    if-eqz v23, :cond_4

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/GridView;->mCheckStates:Landroid/util/SparseBooleanArray;

    move-object/from16 v23, v0

    if-eqz v23, :cond_4

    .line 1499
    move-object/from16 v0, p1

    instance-of v0, v0, Landroid/widget/Checkable;

    move/from16 v23, v0

    if-eqz v23, :cond_d

    move-object/from16 v23, p1

    .line 1500
    check-cast v23, Landroid/widget/Checkable;

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/GridView;->mCheckStates:Landroid/util/SparseBooleanArray;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result v24

    invoke-interface/range {v23 .. v24}, Landroid/widget/Checkable;->setChecked(Z)V

    .line 1507
    :cond_4
    :goto_6
    if-eqz v18, :cond_e

    .line 1508
    const/16 v23, 0x0

    const/16 v24, 0x0

    invoke-static/range {v23 .. v24}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v23

    const/16 v24, 0x0

    move-object/from16 v0, v19

    iget v0, v0, Landroid/widget/AbsListView$LayoutParams;->height:I

    move/from16 v25, v0

    invoke-static/range {v23 .. v25}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    move-result v8

    .line 1511
    .local v8, "childHeightSpec":I
    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mColumnWidth:I

    move/from16 v23, v0

    const/high16 v24, 0x40000000    # 2.0f

    invoke-static/range {v23 .. v24}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v23

    const/16 v24, 0x0

    move-object/from16 v0, v19

    iget v0, v0, Landroid/widget/AbsListView$LayoutParams;->width:I

    move/from16 v25, v0

    invoke-static/range {v23 .. v25}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    move-result v12

    .line 1513
    .local v12, "childWidthSpec":I
    move-object/from16 v0, p1

    invoke-virtual {v0, v12, v8}, Landroid/view/View;->measure(II)V

    .line 1518
    .end local v8    # "childHeightSpec":I
    .end local v12    # "childWidthSpec":I
    :goto_7
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v22

    .line 1519
    .local v22, "w":I
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v13

    .line 1522
    .local v13, "h":I
    if-eqz p4, :cond_f

    move/from16 v11, p3

    .line 1524
    .local v11, "childTop":I
    :goto_8
    invoke-virtual/range {p0 .. p0}, Landroid/widget/GridView;->getLayoutDirection()I

    move-result v16

    .line 1525
    .local v16, "layoutDirection":I
    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mGravity:I

    move/from16 v23, v0

    move/from16 v0, v23

    move/from16 v1, v16

    invoke-static {v0, v1}, Landroid/view/Gravity;->getAbsoluteGravity(II)I

    move-result v6

    .line 1526
    .local v6, "absoluteGravity":I
    and-int/lit8 v23, v6, 0x7

    packed-switch v23, :pswitch_data_0

    .line 1537
    :pswitch_0
    move/from16 v9, p5

    .line 1541
    .local v9, "childLeft":I
    :goto_9
    if-eqz v18, :cond_10

    .line 1542
    add-int v10, v9, v22

    .line 1543
    .local v10, "childRight":I
    add-int v7, v11, v13

    .line 1544
    .local v7, "childBottom":I
    move-object/from16 v0, p1

    invoke-virtual {v0, v9, v11, v10, v7}, Landroid/view/View;->layout(IIII)V

    .line 1550
    .end local v7    # "childBottom":I
    .end local v10    # "childRight":I
    :goto_a
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/widget/GridView;->mCachingStarted:Z

    move/from16 v23, v0

    if-eqz v23, :cond_5

    .line 1551
    const/16 v23, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/View;->setDrawingCacheEnabled(Z)V

    .line 1554
    :cond_5
    if-eqz p7, :cond_6

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v23

    check-cast v23, Landroid/widget/AbsListView$LayoutParams;

    move-object/from16 v0, v23

    iget v0, v0, Landroid/widget/AbsListView$LayoutParams;->scrappedFromPosition:I

    move/from16 v23, v0

    move/from16 v0, v23

    move/from16 v1, p2

    if-eq v0, v1, :cond_6

    .line 1556
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->jumpDrawablesToCurrentState()V

    .line 1559
    :cond_6
    const-wide/16 v24, 0x8

    invoke-static/range {v24 .. v25}, Landroid/os/Trace;->traceEnd(J)V

    .line 1560
    return-void

    .line 1463
    .end local v6    # "absoluteGravity":I
    .end local v9    # "childLeft":I
    .end local v11    # "childTop":I
    .end local v13    # "h":I
    .end local v14    # "isPressed":Z
    .end local v15    # "isSelected":Z
    .end local v16    # "layoutDirection":I
    .end local v17    # "mode":I
    .end local v18    # "needToMeasure":Z
    .end local v19    # "p":Landroid/widget/AbsListView$LayoutParams;
    .end local v20    # "updateChildPressed":Z
    .end local v21    # "updateChildSelected":Z
    .end local v22    # "w":I
    :cond_7
    const/4 v15, 0x0

    goto/16 :goto_0

    .line 1464
    .restart local v15    # "isSelected":Z
    :cond_8
    const/16 v21, 0x0

    goto/16 :goto_1

    .line 1466
    .restart local v17    # "mode":I
    .restart local v21    # "updateChildSelected":Z
    :cond_9
    const/4 v14, 0x0

    goto/16 :goto_2

    .line 1468
    .restart local v14    # "isPressed":Z
    :cond_a
    const/16 v20, 0x0

    goto/16 :goto_3

    .line 1470
    .restart local v20    # "updateChildPressed":Z
    :cond_b
    const/16 v18, 0x0

    goto/16 :goto_4

    .line 1483
    .restart local v18    # "needToMeasure":Z
    .restart local v19    # "p":Landroid/widget/AbsListView$LayoutParams;
    :cond_c
    const/16 v23, 0x0

    move/from16 v0, v23

    move-object/from16 v1, v19

    iput-boolean v0, v1, Landroid/widget/AbsListView$LayoutParams;->forceAdd:Z

    .line 1484
    const/16 v23, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p8

    move-object/from16 v3, v19

    move/from16 v4, v23

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/GridView;->addViewInLayout(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;Z)Z

    goto/16 :goto_5

    .line 1501
    :cond_d
    invoke-virtual/range {p0 .. p0}, Landroid/widget/GridView;->getContext()Landroid/content/Context;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v23

    move-object/from16 v0, v23

    iget v0, v0, Landroid/content/pm/ApplicationInfo;->targetSdkVersion:I

    move/from16 v23, v0

    const/16 v24, 0xb

    move/from16 v0, v23

    move/from16 v1, v24

    if-lt v0, v1, :cond_4

    .line 1503
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/GridView;->mCheckStates:Landroid/util/SparseBooleanArray;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result v23

    move-object/from16 v0, p1

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/View;->setActivated(Z)V

    goto/16 :goto_6

    .line 1515
    :cond_e
    invoke-virtual/range {p0 .. p1}, Landroid/widget/GridView;->cleanupLayoutState(Landroid/view/View;)V

    goto/16 :goto_7

    .line 1522
    .restart local v13    # "h":I
    .restart local v22    # "w":I
    :cond_f
    sub-int v11, p3, v13

    goto/16 :goto_8

    .line 1528
    .restart local v6    # "absoluteGravity":I
    .restart local v11    # "childTop":I
    .restart local v16    # "layoutDirection":I
    :pswitch_1
    move/from16 v9, p5

    .line 1529
    .restart local v9    # "childLeft":I
    goto/16 :goto_9

    .line 1531
    .end local v9    # "childLeft":I
    :pswitch_2
    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mColumnWidth:I

    move/from16 v23, v0

    sub-int v23, v23, v22

    div-int/lit8 v23, v23, 0x2

    add-int v9, p5, v23

    .line 1532
    .restart local v9    # "childLeft":I
    goto/16 :goto_9

    .line 1534
    .end local v9    # "childLeft":I
    :pswitch_3
    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mColumnWidth:I

    move/from16 v23, v0

    add-int v23, v23, p5

    sub-int v9, v23, v22

    .line 1535
    .restart local v9    # "childLeft":I
    goto/16 :goto_9

    .line 1546
    :cond_10
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getLeft()I

    move-result v23

    sub-int v23, v9, v23

    move-object/from16 v0, p1

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/View;->offsetLeftAndRight(I)V

    .line 1547
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getTop()I

    move-result v23

    sub-int v23, v11, v23

    move-object/from16 v0, p1

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/View;->offsetTopAndBottom(I)V

    goto/16 :goto_a

    .line 1526
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method


# virtual methods
.method arrowScroll(I)Z
    .locals 11
    .param p1, "direction"    # I

    .prologue
    const/4 v10, 0x0

    const/4 v9, 0x6

    .line 1823
    iget v5, p0, Landroid/widget/GridView;->mSelectedPosition:I

    .line 1824
    .local v5, "selectedPosition":I
    iget v4, p0, Landroid/widget/GridView;->mNumColumns:I

    .line 1825
    .local v4, "numColumns":I
    invoke-virtual {p0}, Landroid/widget/GridView;->isLayoutRtl()Z

    move-result v2

    .line 1830
    .local v2, "isLayoutRtl":Z
    const/4 v3, 0x0

    .line 1832
    .local v3, "moved":Z
    iget-boolean v7, p0, Landroid/widget/GridView;->mStackFromBottom:Z

    if-nez v7, :cond_3

    .line 1833
    div-int v7, v5, v4

    mul-int v6, v7, v4

    .line 1834
    .local v6, "startOfRowPos":I
    add-int v7, v6, v4

    add-int/lit8 v7, v7, -0x1

    iget v8, p0, Landroid/widget/GridView;->mItemCount:I

    add-int/lit8 v8, v8, -0x1

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 1841
    .local v0, "endOfRowPos":I
    :goto_0
    sparse-switch p1, :sswitch_data_0

    .line 1880
    :cond_0
    :goto_1
    if-eqz v3, :cond_1

    .line 1881
    invoke-static {p1}, Landroid/view/SoundEffectConstants;->getContantForFocusDirection(I)I

    move-result v7

    invoke-virtual {p0, v7}, Landroid/widget/GridView;->playSoundEffect(I)V

    .line 1882
    invoke-virtual {p0}, Landroid/widget/GridView;->invokeOnItemScrollListener()V

    .line 1885
    :cond_1
    if-eqz v3, :cond_2

    .line 1886
    invoke-virtual {p0}, Landroid/widget/GridView;->awakenScrollBars()Z

    .line 1889
    :cond_2
    return v3

    .line 1836
    .end local v0    # "endOfRowPos":I
    .end local v6    # "startOfRowPos":I
    :cond_3
    iget v7, p0, Landroid/widget/GridView;->mItemCount:I

    add-int/lit8 v7, v7, -0x1

    sub-int v1, v7, v5

    .line 1837
    .local v1, "invertedSelection":I
    iget v7, p0, Landroid/widget/GridView;->mItemCount:I

    add-int/lit8 v7, v7, -0x1

    div-int v8, v1, v4

    mul-int/2addr v8, v4

    sub-int v0, v7, v8

    .line 1838
    .restart local v0    # "endOfRowPos":I
    sub-int v7, v0, v4

    add-int/lit8 v7, v7, 0x1

    invoke-static {v10, v7}, Ljava/lang/Math;->max(II)I

    move-result v6

    .restart local v6    # "startOfRowPos":I
    goto :goto_0

    .line 1843
    .end local v1    # "invertedSelection":I
    :sswitch_0
    if-lez v6, :cond_0

    .line 1844
    iput v9, p0, Landroid/widget/GridView;->mLayoutMode:I

    .line 1845
    sub-int v7, v5, v4

    invoke-static {v10, v7}, Ljava/lang/Math;->max(II)I

    move-result v7

    invoke-virtual {p0, v7}, Landroid/widget/GridView;->setSelectionInt(I)V

    .line 1846
    const/4 v3, 0x1

    goto :goto_1

    .line 1850
    :sswitch_1
    iget v7, p0, Landroid/widget/GridView;->mItemCount:I

    add-int/lit8 v7, v7, -0x1

    if-ge v0, v7, :cond_0

    .line 1851
    iput v9, p0, Landroid/widget/GridView;->mLayoutMode:I

    .line 1852
    add-int v7, v5, v4

    iget v8, p0, Landroid/widget/GridView;->mItemCount:I

    add-int/lit8 v8, v8, -0x1

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v7

    invoke-virtual {p0, v7}, Landroid/widget/GridView;->setSelectionInt(I)V

    .line 1853
    const/4 v3, 0x1

    goto :goto_1

    .line 1857
    :sswitch_2
    if-nez v2, :cond_4

    if-le v5, v6, :cond_4

    .line 1858
    iput v9, p0, Landroid/widget/GridView;->mLayoutMode:I

    .line 1859
    add-int/lit8 v7, v5, -0x1

    invoke-static {v10, v7}, Ljava/lang/Math;->max(II)I

    move-result v7

    invoke-virtual {p0, v7}, Landroid/widget/GridView;->setSelectionInt(I)V

    .line 1860
    const/4 v3, 0x1

    goto :goto_1

    .line 1861
    :cond_4
    if-eqz v2, :cond_0

    if-ge v5, v0, :cond_0

    .line 1862
    iput v9, p0, Landroid/widget/GridView;->mLayoutMode:I

    .line 1863
    add-int/lit8 v7, v5, 0x1

    iget v8, p0, Landroid/widget/GridView;->mItemCount:I

    add-int/lit8 v8, v8, -0x1

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v7

    invoke-virtual {p0, v7}, Landroid/widget/GridView;->setSelectionInt(I)V

    .line 1864
    const/4 v3, 0x1

    goto :goto_1

    .line 1868
    :sswitch_3
    if-nez v2, :cond_5

    if-ge v5, v0, :cond_5

    .line 1869
    iput v9, p0, Landroid/widget/GridView;->mLayoutMode:I

    .line 1870
    add-int/lit8 v7, v5, 0x1

    iget v8, p0, Landroid/widget/GridView;->mItemCount:I

    add-int/lit8 v8, v8, -0x1

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v7

    invoke-virtual {p0, v7}, Landroid/widget/GridView;->setSelectionInt(I)V

    .line 1871
    const/4 v3, 0x1

    goto/16 :goto_1

    .line 1872
    :cond_5
    if-eqz v2, :cond_0

    if-le v5, v6, :cond_0

    .line 1873
    iput v9, p0, Landroid/widget/GridView;->mLayoutMode:I

    .line 1874
    add-int/lit8 v7, v5, -0x1

    invoke-static {v10, v7}, Ljava/lang/Math;->max(II)I

    move-result v7

    invoke-virtual {p0, v7}, Landroid/widget/GridView;->setSelectionInt(I)V

    .line 1875
    const/4 v3, 0x1

    goto/16 :goto_1

    .line 1841
    :sswitch_data_0
    .sparse-switch
        0x11 -> :sswitch_2
        0x21 -> :sswitch_0
        0x42 -> :sswitch_3
        0x82 -> :sswitch_1
    .end sparse-switch
.end method

.method protected attachLayoutAnimationParameters(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;II)V
    .locals 4
    .param p1, "child"    # Landroid/view/View;
    .param p2, "params"    # Landroid/view/ViewGroup$LayoutParams;
    .param p3, "index"    # I
    .param p4, "count"    # I

    .prologue
    .line 1125
    iget-object v0, p2, Landroid/view/ViewGroup$LayoutParams;->layoutAnimationParameters:Landroid/view/animation/LayoutAnimationController$AnimationParameters;

    check-cast v0, Landroid/view/animation/GridLayoutAnimationController$AnimationParameters;

    .line 1128
    .local v0, "animationParams":Landroid/view/animation/GridLayoutAnimationController$AnimationParameters;
    if-nez v0, :cond_0

    .line 1129
    new-instance v0, Landroid/view/animation/GridLayoutAnimationController$AnimationParameters;

    .end local v0    # "animationParams":Landroid/view/animation/GridLayoutAnimationController$AnimationParameters;
    invoke-direct {v0}, Landroid/view/animation/GridLayoutAnimationController$AnimationParameters;-><init>()V

    .line 1130
    .restart local v0    # "animationParams":Landroid/view/animation/GridLayoutAnimationController$AnimationParameters;
    iput-object v0, p2, Landroid/view/ViewGroup$LayoutParams;->layoutAnimationParameters:Landroid/view/animation/LayoutAnimationController$AnimationParameters;

    .line 1133
    :cond_0
    iput p4, v0, Landroid/view/animation/GridLayoutAnimationController$AnimationParameters;->count:I

    .line 1134
    iput p3, v0, Landroid/view/animation/GridLayoutAnimationController$AnimationParameters;->index:I

    .line 1135
    iget v2, p0, Landroid/widget/GridView;->mNumColumns:I

    iput v2, v0, Landroid/view/animation/GridLayoutAnimationController$AnimationParameters;->columnsCount:I

    .line 1136
    iget v2, p0, Landroid/widget/GridView;->mNumColumns:I

    div-int v2, p4, v2

    iput v2, v0, Landroid/view/animation/GridLayoutAnimationController$AnimationParameters;->rowsCount:I

    .line 1138
    iget-boolean v2, p0, Landroid/widget/GridView;->mStackFromBottom:Z

    if-nez v2, :cond_1

    .line 1139
    iget v2, p0, Landroid/widget/GridView;->mNumColumns:I

    rem-int v2, p3, v2

    iput v2, v0, Landroid/view/animation/GridLayoutAnimationController$AnimationParameters;->column:I

    .line 1140
    iget v2, p0, Landroid/widget/GridView;->mNumColumns:I

    div-int v2, p3, v2

    iput v2, v0, Landroid/view/animation/GridLayoutAnimationController$AnimationParameters;->row:I

    .line 1147
    :goto_0
    return-void

    .line 1142
    :cond_1
    add-int/lit8 v2, p4, -0x1

    sub-int v1, v2, p3

    .line 1144
    .local v1, "invertedIndex":I
    iget v2, p0, Landroid/widget/GridView;->mNumColumns:I

    add-int/lit8 v2, v2, -0x1

    iget v3, p0, Landroid/widget/GridView;->mNumColumns:I

    rem-int v3, v1, v3

    sub-int/2addr v2, v3

    iput v2, v0, Landroid/view/animation/GridLayoutAnimationController$AnimationParameters;->column:I

    .line 1145
    iget v2, v0, Landroid/view/animation/GridLayoutAnimationController$AnimationParameters;->rowsCount:I

    add-int/lit8 v2, v2, -0x1

    iget v3, p0, Landroid/widget/GridView;->mNumColumns:I

    div-int v3, v1, v3

    sub-int/2addr v2, v3

    iput v2, v0, Landroid/view/animation/GridLayoutAnimationController$AnimationParameters;->row:I

    goto :goto_0
.end method

.method protected computeVerticalScrollExtent()I
    .locals 10

    .prologue
    const/4 v8, 0x0

    .line 2294
    invoke-virtual {p0}, Landroid/widget/GridView;->getChildCount()I

    move-result v1

    .line 2295
    .local v1, "count":I
    if-lez v1, :cond_2

    .line 2296
    iget v4, p0, Landroid/widget/GridView;->mNumColumns:I

    .line 2297
    .local v4, "numColumns":I
    add-int v9, v1, v4

    add-int/lit8 v9, v9, -0x1

    div-int v5, v9, v4

    .line 2299
    .local v5, "rowCount":I
    mul-int/lit8 v2, v5, 0x64

    .line 2301
    .local v2, "extent":I
    invoke-virtual {p0, v8}, Landroid/widget/GridView;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    .line 2302
    .local v7, "view":Landroid/view/View;
    invoke-virtual {v7}, Landroid/view/View;->getTop()I

    move-result v6

    .line 2303
    .local v6, "top":I
    invoke-virtual {v7}, Landroid/view/View;->getHeight()I

    move-result v3

    .line 2304
    .local v3, "height":I
    if-lez v3, :cond_0

    .line 2305
    mul-int/lit8 v8, v6, 0x64

    div-int/2addr v8, v3

    add-int/2addr v2, v8

    .line 2308
    :cond_0
    add-int/lit8 v8, v1, -0x1

    invoke-virtual {p0, v8}, Landroid/widget/GridView;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    .line 2309
    invoke-virtual {v7}, Landroid/view/View;->getBottom()I

    move-result v0

    .line 2310
    .local v0, "bottom":I
    invoke-virtual {v7}, Landroid/view/View;->getHeight()I

    move-result v3

    .line 2311
    if-lez v3, :cond_1

    .line 2312
    invoke-virtual {p0}, Landroid/widget/GridView;->getHeight()I

    move-result v8

    sub-int v8, v0, v8

    mul-int/lit8 v8, v8, 0x64

    div-int/2addr v8, v3

    sub-int/2addr v2, v8

    .line 2317
    .end local v0    # "bottom":I
    .end local v2    # "extent":I
    .end local v3    # "height":I
    .end local v4    # "numColumns":I
    .end local v5    # "rowCount":I
    .end local v6    # "top":I
    .end local v7    # "view":Landroid/view/View;
    :cond_1
    :goto_0
    return v2

    :cond_2
    move v2, v8

    goto :goto_0
.end method

.method protected computeVerticalScrollOffset()I
    .locals 11

    .prologue
    const/4 v7, 0x0

    .line 2322
    iget v8, p0, Landroid/widget/GridView;->mFirstPosition:I

    if-ltz v8, :cond_0

    invoke-virtual {p0}, Landroid/widget/GridView;->getChildCount()I

    move-result v8

    if-lez v8, :cond_0

    .line 2323
    invoke-virtual {p0, v7}, Landroid/widget/GridView;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 2324
    .local v5, "view":Landroid/view/View;
    invoke-virtual {v5}, Landroid/view/View;->getTop()I

    move-result v4

    .line 2325
    .local v4, "top":I
    invoke-virtual {v5}, Landroid/view/View;->getHeight()I

    move-result v0

    .line 2326
    .local v0, "height":I
    if-lez v0, :cond_0

    .line 2327
    iget v1, p0, Landroid/widget/GridView;->mNumColumns:I

    .line 2328
    .local v1, "numColumns":I
    iget v8, p0, Landroid/widget/GridView;->mItemCount:I

    add-int/2addr v8, v1

    add-int/lit8 v8, v8, -0x1

    div-int v3, v8, v1

    .line 2332
    .local v3, "rowCount":I
    invoke-virtual {p0}, Landroid/widget/GridView;->isStackFromBottom()Z

    move-result v8

    if-eqz v8, :cond_1

    mul-int v8, v3, v1

    iget v9, p0, Landroid/widget/GridView;->mItemCount:I

    sub-int v2, v8, v9

    .line 2334
    .local v2, "oddItemsOnFirstRow":I
    :goto_0
    iget v8, p0, Landroid/widget/GridView;->mFirstPosition:I

    add-int/2addr v8, v2

    div-int v6, v8, v1

    .line 2335
    .local v6, "whichRow":I
    mul-int/lit8 v8, v6, 0x64

    mul-int/lit8 v9, v4, 0x64

    div-int/2addr v9, v0

    sub-int/2addr v8, v9

    iget v9, p0, Landroid/widget/GridView;->mScrollY:I

    int-to-float v9, v9

    invoke-virtual {p0}, Landroid/widget/GridView;->getHeight()I

    move-result v10

    int-to-float v10, v10

    div-float/2addr v9, v10

    int-to-float v10, v3

    mul-float/2addr v9, v10

    const/high16 v10, 0x42c80000    # 100.0f

    mul-float/2addr v9, v10

    float-to-int v9, v9

    add-int/2addr v8, v9

    invoke-static {v8, v7}, Ljava/lang/Math;->max(II)I

    move-result v7

    .line 2339
    .end local v0    # "height":I
    .end local v1    # "numColumns":I
    .end local v2    # "oddItemsOnFirstRow":I
    .end local v3    # "rowCount":I
    .end local v4    # "top":I
    .end local v5    # "view":Landroid/view/View;
    .end local v6    # "whichRow":I
    :cond_0
    return v7

    .restart local v0    # "height":I
    .restart local v1    # "numColumns":I
    .restart local v3    # "rowCount":I
    .restart local v4    # "top":I
    .restart local v5    # "view":Landroid/view/View;
    :cond_1
    move v2, v7

    .line 2332
    goto :goto_0
.end method

.method protected computeVerticalScrollRange()I
    .locals 5

    .prologue
    .line 2345
    iget v0, p0, Landroid/widget/GridView;->mNumColumns:I

    .line 2346
    .local v0, "numColumns":I
    iget v3, p0, Landroid/widget/GridView;->mItemCount:I

    add-int/2addr v3, v0

    add-int/lit8 v3, v3, -0x1

    div-int v2, v3, v0

    .line 2347
    .local v2, "rowCount":I
    mul-int/lit8 v3, v2, 0x64

    const/4 v4, 0x0

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 2348
    .local v1, "result":I
    iget v3, p0, Landroid/widget/GridView;->mScrollY:I

    if-eqz v3, :cond_0

    .line 2350
    iget v3, p0, Landroid/widget/GridView;->mScrollY:I

    int-to-float v3, v3

    invoke-virtual {p0}, Landroid/widget/GridView;->getHeight()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v3, v4

    int-to-float v4, v2

    mul-float/2addr v3, v4

    const/high16 v4, 0x42c80000    # 100.0f

    mul-float/2addr v3, v4

    float-to-int v3, v3

    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v3

    add-int/2addr v1, v3

    .line 2352
    :cond_0
    return v1
.end method

.method fillGap(Z)V
    .locals 9
    .param p1, "down"    # Z

    .prologue
    const/16 v8, 0x22

    .line 248
    iget v1, p0, Landroid/widget/GridView;->mNumColumns:I

    .line 249
    .local v1, "numColumns":I
    iget v6, p0, Landroid/widget/GridView;->mVerticalSpacing:I

    .line 251
    .local v6, "verticalSpacing":I
    invoke-virtual {p0}, Landroid/widget/GridView;->getChildCount()I

    move-result v0

    .line 253
    .local v0, "count":I
    if-eqz p1, :cond_3

    .line 254
    const/4 v3, 0x0

    .line 255
    .local v3, "paddingTop":I
    iget v7, p0, Landroid/widget/GridView;->mGroupFlags:I

    and-int/lit8 v7, v7, 0x22

    if-ne v7, v8, :cond_0

    .line 256
    invoke-virtual {p0}, Landroid/widget/GridView;->getListPaddingTop()I

    move-result v3

    .line 258
    :cond_0
    if-lez v0, :cond_2

    add-int/lit8 v7, v0, -0x1

    invoke-virtual {p0, v7}, Landroid/widget/GridView;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v7}, Landroid/view/View;->getBottom()I

    move-result v7

    add-int v5, v7, v6

    .line 260
    .local v5, "startOffset":I
    :goto_0
    iget v7, p0, Landroid/widget/GridView;->mFirstPosition:I

    add-int v4, v7, v0

    .line 261
    .local v4, "position":I
    iget-boolean v7, p0, Landroid/widget/GridView;->mStackFromBottom:Z

    if-eqz v7, :cond_1

    .line 262
    add-int/lit8 v7, v1, -0x1

    add-int/2addr v4, v7

    .line 264
    :cond_1
    invoke-direct {p0, v4, v5}, Landroid/widget/GridView;->fillDown(II)Landroid/view/View;

    .line 265
    invoke-virtual {p0}, Landroid/widget/GridView;->getChildCount()I

    move-result v7

    invoke-direct {p0, v1, v6, v7}, Landroid/widget/GridView;->correctTooHigh(III)V

    .line 282
    .end local v3    # "paddingTop":I
    :goto_1
    return-void

    .end local v4    # "position":I
    .end local v5    # "startOffset":I
    .restart local v3    # "paddingTop":I
    :cond_2
    move v5, v3

    .line 258
    goto :goto_0

    .line 267
    .end local v3    # "paddingTop":I
    :cond_3
    const/4 v2, 0x0

    .line 268
    .local v2, "paddingBottom":I
    iget v7, p0, Landroid/widget/GridView;->mGroupFlags:I

    and-int/lit8 v7, v7, 0x22

    if-ne v7, v8, :cond_4

    .line 269
    invoke-virtual {p0}, Landroid/widget/GridView;->getListPaddingBottom()I

    move-result v2

    .line 271
    :cond_4
    if-lez v0, :cond_5

    const/4 v7, 0x0

    invoke-virtual {p0, v7}, Landroid/widget/GridView;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v7}, Landroid/view/View;->getTop()I

    move-result v7

    sub-int v5, v7, v6

    .line 273
    .restart local v5    # "startOffset":I
    :goto_2
    iget v4, p0, Landroid/widget/GridView;->mFirstPosition:I

    .line 274
    .restart local v4    # "position":I
    iget-boolean v7, p0, Landroid/widget/GridView;->mStackFromBottom:Z

    if-nez v7, :cond_6

    .line 275
    sub-int/2addr v4, v1

    .line 279
    :goto_3
    invoke-direct {p0, v4, v5}, Landroid/widget/GridView;->fillUp(II)Landroid/view/View;

    .line 280
    invoke-virtual {p0}, Landroid/widget/GridView;->getChildCount()I

    move-result v7

    invoke-direct {p0, v1, v6, v7}, Landroid/widget/GridView;->correctTooLow(III)V

    goto :goto_1

    .line 271
    .end local v4    # "position":I
    .end local v5    # "startOffset":I
    :cond_5
    invoke-virtual {p0}, Landroid/widget/GridView;->getHeight()I

    move-result v7

    sub-int v5, v7, v2

    goto :goto_2

    .line 277
    .restart local v4    # "position":I
    .restart local v5    # "startOffset":I
    :cond_6
    add-int/lit8 v4, v4, -0x1

    goto :goto_3
.end method

.method findMotionRow(I)I
    .locals 4
    .param p1, "y"    # I

    .prologue
    .line 519
    invoke-virtual {p0}, Landroid/widget/GridView;->getChildCount()I

    move-result v0

    .line 520
    .local v0, "childCount":I
    if-lez v0, :cond_3

    .line 522
    iget v2, p0, Landroid/widget/GridView;->mNumColumns:I

    .line 523
    .local v2, "numColumns":I
    iget-boolean v3, p0, Landroid/widget/GridView;->mStackFromBottom:Z

    if-nez v3, :cond_1

    .line 524
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_3

    .line 525
    invoke-virtual {p0, v1}, Landroid/widget/GridView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getBottom()I

    move-result v3

    if-gt p1, v3, :cond_0

    .line 526
    iget v3, p0, Landroid/widget/GridView;->mFirstPosition:I

    add-int/2addr v3, v1

    .line 537
    .end local v1    # "i":I
    .end local v2    # "numColumns":I
    :goto_1
    return v3

    .line 524
    .restart local v1    # "i":I
    .restart local v2    # "numColumns":I
    :cond_0
    add-int/2addr v1, v2

    goto :goto_0

    .line 530
    .end local v1    # "i":I
    :cond_1
    add-int/lit8 v1, v0, -0x1

    .restart local v1    # "i":I
    :goto_2
    if-ltz v1, :cond_3

    .line 531
    invoke-virtual {p0, v1}, Landroid/widget/GridView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getTop()I

    move-result v3

    if-lt p1, v3, :cond_2

    .line 532
    iget v3, p0, Landroid/widget/GridView;->mFirstPosition:I

    add-int/2addr v3, v1

    goto :goto_1

    .line 530
    :cond_2
    sub-int/2addr v1, v2

    goto :goto_2

    .line 537
    .end local v1    # "i":I
    .end local v2    # "numColumns":I
    :cond_3
    const/4 v3, -0x1

    goto :goto_1
.end method

.method fullScroll(I)Z
    .locals 3
    .param p1, "direction"    # I

    .prologue
    const/4 v2, 0x2

    .line 1794
    const/4 v0, 0x0

    .line 1795
    .local v0, "moved":Z
    const/16 v1, 0x21

    if-ne p1, v1, :cond_2

    .line 1796
    iput v2, p0, Landroid/widget/GridView;->mLayoutMode:I

    .line 1797
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroid/widget/GridView;->setSelectionInt(I)V

    .line 1798
    invoke-virtual {p0}, Landroid/widget/GridView;->invokeOnItemScrollListener()V

    .line 1799
    const/4 v0, 0x1

    .line 1807
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 1808
    invoke-virtual {p0}, Landroid/widget/GridView;->awakenScrollBars()Z

    .line 1811
    :cond_1
    return v0

    .line 1800
    :cond_2
    const/16 v1, 0x82

    if-ne p1, v1, :cond_0

    .line 1801
    iput v2, p0, Landroid/widget/GridView;->mLayoutMode:I

    .line 1802
    iget v1, p0, Landroid/widget/GridView;->mItemCount:I

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p0, v1}, Landroid/widget/GridView;->setSelectionInt(I)V

    .line 1803
    invoke-virtual {p0}, Landroid/widget/GridView;->invokeOnItemScrollListener()V

    .line 1804
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public bridge synthetic getAdapter()Landroid/widget/Adapter;
    .locals 1

    .prologue
    .line 60
    invoke-virtual {p0}, Landroid/widget/GridView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    return-object v0
.end method

.method public getAdapter()Landroid/widget/ListAdapter;
    .locals 1

    .prologue
    .line 167
    iget-object v0, p0, Landroid/widget/GridView;->mAdapter:Landroid/widget/ListAdapter;

    return-object v0
.end method

.method public getColumnWidth()I
    .locals 1

    .prologue
    .line 2197
    iget v0, p0, Landroid/widget/GridView;->mColumnWidth:I

    return v0
.end method

.method public getGravity()I
    .locals 1

    .prologue
    .line 2061
    iget v0, p0, Landroid/widget/GridView;->mGravity:I

    return v0
.end method

.method public getHorizontalSpacing()I
    .locals 1

    .prologue
    .line 2096
    iget v0, p0, Landroid/widget/GridView;->mHorizontalSpacing:I

    return v0
.end method

.method public getNumColumns()I
    .locals 1
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
    .end annotation

    .prologue
    .line 2241
    iget v0, p0, Landroid/widget/GridView;->mNumColumns:I

    return v0
.end method

.method public getRequestedColumnWidth()I
    .locals 1

    .prologue
    .line 2214
    iget v0, p0, Landroid/widget/GridView;->mRequestedColumnWidth:I

    return v0
.end method

.method public getRequestedHorizontalSpacing()I
    .locals 1

    .prologue
    .line 2116
    iget v0, p0, Landroid/widget/GridView;->mRequestedHorizontalSpacing:I

    return v0
.end method

.method public getStretchMode()I
    .locals 1

    .prologue
    .line 2167
    iget v0, p0, Landroid/widget/GridView;->mStretchMode:I

    return v0
.end method

.method public getVerticalSpacing()I
    .locals 1

    .prologue
    .line 2147
    iget v0, p0, Landroid/widget/GridView;->mVerticalSpacing:I

    return v0
.end method

.method protected layoutChildren()V
    .locals 35

    .prologue
    .line 1151
    move-object/from16 v0, p0

    iget-boolean v7, v0, Landroid/widget/GridView;->mBlockLayoutRequests:Z

    .line 1152
    .local v7, "blockLayoutRequests":Z
    if-nez v7, :cond_0

    .line 1153
    const/16 v32, 0x1

    move/from16 v0, v32

    move-object/from16 v1, p0

    iput-boolean v0, v1, Landroid/widget/GridView;->mBlockLayoutRequests:Z

    .line 1157
    :cond_0
    :try_start_0
    invoke-super/range {p0 .. p0}, Landroid/widget/AbsListView;->layoutChildren()V

    .line 1159
    invoke-virtual/range {p0 .. p0}, Landroid/widget/GridView;->invalidate()V

    .line 1161
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/GridView;->mAdapter:Landroid/widget/ListAdapter;

    move-object/from16 v32, v0

    if-nez v32, :cond_2

    .line 1162
    invoke-virtual/range {p0 .. p0}, Landroid/widget/GridView;->resetList()V

    .line 1163
    invoke-virtual/range {p0 .. p0}, Landroid/widget/GridView;->invokeOnItemScrollListener()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1397
    if-nez v7, :cond_1

    .line 1398
    const/16 v32, 0x0

    move/from16 v0, v32

    move-object/from16 v1, p0

    iput-boolean v0, v1, Landroid/widget/GridView;->mBlockLayoutRequests:Z

    .line 1401
    :cond_1
    :goto_0
    return-void

    .line 1167
    :cond_2
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/GridView;->mListPadding:Landroid/graphics/Rect;

    move-object/from16 v32, v0

    move-object/from16 v0, v32

    iget v11, v0, Landroid/graphics/Rect;->top:I

    .line 1168
    .local v11, "childrenTop":I
    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mBottom:I

    move/from16 v32, v0

    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mTop:I

    move/from16 v33, v0

    sub-int v32, v32, v33

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/GridView;->mListPadding:Landroid/graphics/Rect;

    move-object/from16 v33, v0

    move-object/from16 v0, v33

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    move/from16 v33, v0

    sub-int v10, v32, v33

    .line 1170
    .local v10, "childrenBottom":I
    invoke-virtual/range {p0 .. p0}, Landroid/widget/GridView;->getChildCount()I

    move-result v9

    .line 1172
    .local v9, "childCount":I
    const/4 v13, 0x0

    .line 1175
    .local v13, "delta":I
    const/16 v24, 0x0

    .line 1176
    .local v24, "oldSel":Landroid/view/View;
    const/16 v23, 0x0

    .line 1177
    .local v23, "oldFirst":Landroid/view/View;
    const/16 v22, 0x0

    .line 1180
    .local v22, "newSel":Landroid/view/View;
    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mLayoutMode:I

    move/from16 v32, v0

    packed-switch v32, :pswitch_data_0

    .line 1199
    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mSelectedPosition:I

    move/from16 v32, v0

    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mFirstPosition:I

    move/from16 v33, v0

    sub-int v19, v32, v33

    .line 1200
    .local v19, "index":I
    if-ltz v19, :cond_3

    move/from16 v0, v19

    if-ge v0, v9, :cond_3

    .line 1201
    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/widget/GridView;->getChildAt(I)Landroid/view/View;

    move-result-object v24

    .line 1205
    :cond_3
    const/16 v32, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v32

    invoke-virtual {v0, v1}, Landroid/widget/GridView;->getChildAt(I)Landroid/view/View;

    move-result-object v23

    .line 1208
    .end local v19    # "index":I
    :cond_4
    :goto_1
    :pswitch_0
    move-object/from16 v0, p0

    iget-boolean v12, v0, Landroid/widget/GridView;->mDataChanged:Z

    .line 1209
    .local v12, "dataChanged":Z
    if-eqz v12, :cond_5

    .line 1210
    invoke-virtual/range {p0 .. p0}, Landroid/widget/GridView;->handleDataChanged()V

    .line 1215
    :cond_5
    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mItemCount:I

    move/from16 v32, v0

    if-nez v32, :cond_6

    .line 1216
    invoke-virtual/range {p0 .. p0}, Landroid/widget/GridView;->resetList()V

    .line 1217
    invoke-virtual/range {p0 .. p0}, Landroid/widget/GridView;->invokeOnItemScrollListener()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1397
    if-nez v7, :cond_1

    .line 1398
    const/16 v32, 0x0

    move/from16 v0, v32

    move-object/from16 v1, p0

    iput-boolean v0, v1, Landroid/widget/GridView;->mBlockLayoutRequests:Z

    goto/16 :goto_0

    .line 1182
    .end local v12    # "dataChanged":Z
    :pswitch_1
    :try_start_2
    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mNextSelectedPosition:I

    move/from16 v32, v0

    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mFirstPosition:I

    move/from16 v33, v0

    sub-int v19, v32, v33

    .line 1183
    .restart local v19    # "index":I
    if-ltz v19, :cond_4

    move/from16 v0, v19

    if-ge v0, v9, :cond_4

    .line 1184
    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/widget/GridView;->getChildAt(I)Landroid/view/View;

    move-result-object v22

    goto :goto_1

    .line 1193
    .end local v19    # "index":I
    :pswitch_2
    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mNextSelectedPosition:I

    move/from16 v32, v0

    if-ltz v32, :cond_4

    .line 1194
    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mNextSelectedPosition:I

    move/from16 v32, v0

    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mSelectedPosition:I

    move/from16 v33, v0

    sub-int v13, v32, v33

    goto :goto_1

    .line 1221
    .restart local v12    # "dataChanged":Z
    :cond_6
    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mNextSelectedPosition:I

    move/from16 v32, v0

    move-object/from16 v0, p0

    move/from16 v1, v32

    invoke-virtual {v0, v1}, Landroid/widget/GridView;->setSelectedPositionInt(I)V

    .line 1223
    const/4 v4, 0x0

    .line 1224
    .local v4, "accessibilityFocusLayoutRestoreNode":Landroid/view/accessibility/AccessibilityNodeInfo;
    const/4 v5, 0x0

    .line 1225
    .local v5, "accessibilityFocusLayoutRestoreView":Landroid/view/View;
    const/4 v6, -0x1

    .line 1230
    .local v6, "accessibilityFocusPosition":I
    invoke-virtual/range {p0 .. p0}, Landroid/widget/GridView;->getViewRootImpl()Landroid/view/ViewRootImpl;

    move-result-object v30

    .line 1231
    .local v30, "viewRootImpl":Landroid/view/ViewRootImpl;
    if-eqz v30, :cond_9

    .line 1232
    invoke-virtual/range {v30 .. v30}, Landroid/view/ViewRootImpl;->getAccessibilityFocusedHost()Landroid/view/View;

    move-result-object v16

    .line 1233
    .local v16, "focusHost":Landroid/view/View;
    if-eqz v16, :cond_9

    .line 1234
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/widget/GridView;->getAccessibilityFocusedChild(Landroid/view/View;)Landroid/view/View;

    move-result-object v15

    .line 1235
    .local v15, "focusChild":Landroid/view/View;
    if-eqz v15, :cond_9

    .line 1236
    if-eqz v12, :cond_7

    invoke-virtual {v15}, Landroid/view/View;->hasTransientState()Z

    move-result v32

    if-nez v32, :cond_7

    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/widget/GridView;->mAdapterHasStableIds:Z

    move/from16 v32, v0

    if-eqz v32, :cond_8

    .line 1240
    :cond_7
    move-object/from16 v5, v16

    .line 1241
    invoke-virtual/range {v30 .. v30}, Landroid/view/ViewRootImpl;->getAccessibilityFocusedVirtualView()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v4

    .line 1246
    :cond_8
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Landroid/widget/GridView;->getPositionForView(Landroid/view/View;)I

    move-result v6

    .line 1253
    .end local v15    # "focusChild":Landroid/view/View;
    .end local v16    # "focusHost":Landroid/view/View;
    :cond_9
    move-object/from16 v0, p0

    iget v14, v0, Landroid/widget/GridView;->mFirstPosition:I

    .line 1254
    .local v14, "firstPosition":I
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/GridView;->mRecycler:Landroid/widget/AbsListView$RecycleBin;

    move-object/from16 v27, v0

    .line 1256
    .local v27, "recycleBin":Landroid/widget/AbsListView$RecycleBin;
    if-eqz v12, :cond_a

    .line 1257
    const/16 v17, 0x0

    .local v17, "i":I
    :goto_2
    move/from16 v0, v17

    if-ge v0, v9, :cond_b

    .line 1258
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/widget/GridView;->getChildAt(I)Landroid/view/View;

    move-result-object v32

    add-int v33, v14, v17

    move-object/from16 v0, v27

    move-object/from16 v1, v32

    move/from16 v2, v33

    invoke-virtual {v0, v1, v2}, Landroid/widget/AbsListView$RecycleBin;->addScrapView(Landroid/view/View;I)V

    .line 1257
    add-int/lit8 v17, v17, 0x1

    goto :goto_2

    .line 1261
    .end local v17    # "i":I
    :cond_a
    move-object/from16 v0, v27

    invoke-virtual {v0, v9, v14}, Landroid/widget/AbsListView$RecycleBin;->fillActiveViews(II)V

    .line 1265
    :cond_b
    invoke-virtual/range {p0 .. p0}, Landroid/widget/GridView;->detachAllViewsFromParent()V

    .line 1266
    invoke-virtual/range {v27 .. v27}, Landroid/widget/AbsListView$RecycleBin;->removeSkippedScrap()V

    .line 1268
    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mLayoutMode:I

    move/from16 v32, v0

    packed-switch v32, :pswitch_data_1

    .line 1296
    if-nez v9, :cond_17

    .line 1297
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/widget/GridView;->mStackFromBottom:Z

    move/from16 v32, v0

    if-nez v32, :cond_14

    .line 1298
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/GridView;->mAdapter:Landroid/widget/ListAdapter;

    move-object/from16 v32, v0

    if-eqz v32, :cond_c

    invoke-virtual/range {p0 .. p0}, Landroid/widget/GridView;->isInTouchMode()Z

    move-result v32

    if-eqz v32, :cond_13

    :cond_c
    const/16 v32, -0x1

    :goto_3
    move-object/from16 v0, p0

    move/from16 v1, v32

    invoke-virtual {v0, v1}, Landroid/widget/GridView;->setSelectedPositionInt(I)V

    .line 1300
    move-object/from16 v0, p0

    invoke-direct {v0, v11}, Landroid/widget/GridView;->fillFromTop(I)Landroid/view/View;

    move-result-object v29

    .line 1322
    .end local v11    # "childrenTop":I
    .local v29, "sel":Landroid/view/View;
    :goto_4
    invoke-virtual/range {v27 .. v27}, Landroid/widget/AbsListView$RecycleBin;->scrapActiveViews()V

    .line 1324
    if-eqz v29, :cond_1c

    .line 1325
    const/16 v32, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v32

    move-object/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Landroid/widget/GridView;->positionSelector(ILandroid/view/View;)V

    .line 1326
    invoke-virtual/range {v29 .. v29}, Landroid/view/View;->getTop()I

    move-result v32

    move/from16 v0, v32

    move-object/from16 v1, p0

    iput v0, v1, Landroid/widget/GridView;->mSelectedTop:I

    .line 1352
    :cond_d
    :goto_5
    if-eqz v30, :cond_e

    .line 1353
    invoke-virtual/range {v30 .. v30}, Landroid/view/ViewRootImpl;->getAccessibilityFocusedHost()Landroid/view/View;

    move-result-object v21

    .line 1354
    .local v21, "newAccessibilityFocusedView":Landroid/view/View;
    if-nez v21, :cond_e

    .line 1355
    if-eqz v5, :cond_21

    invoke-virtual {v5}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v32

    if-eqz v32, :cond_21

    .line 1357
    invoke-virtual {v5}, Landroid/view/View;->getAccessibilityNodeProvider()Landroid/view/accessibility/AccessibilityNodeProvider;

    move-result-object v26

    .line 1359
    .local v26, "provider":Landroid/view/accessibility/AccessibilityNodeProvider;
    if-eqz v4, :cond_20

    if-eqz v26, :cond_20

    .line 1360
    invoke-virtual {v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->getSourceNodeId()J

    move-result-wide v32

    invoke-static/range {v32 .. v33}, Landroid/view/accessibility/AccessibilityNodeInfo;->getVirtualDescendantId(J)I

    move-result v31

    .line 1362
    .local v31, "virtualViewId":I
    const/16 v32, 0x40

    const/16 v33, 0x0

    move-object/from16 v0, v26

    move/from16 v1, v31

    move/from16 v2, v32

    move-object/from16 v3, v33

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/accessibility/AccessibilityNodeProvider;->performAction(IILandroid/os/Bundle;)Z

    .line 1380
    .end local v21    # "newAccessibilityFocusedView":Landroid/view/View;
    .end local v26    # "provider":Landroid/view/accessibility/AccessibilityNodeProvider;
    .end local v31    # "virtualViewId":I
    :cond_e
    :goto_6
    const/16 v32, 0x0

    move/from16 v0, v32

    move-object/from16 v1, p0

    iput v0, v1, Landroid/widget/GridView;->mLayoutMode:I

    .line 1381
    const/16 v32, 0x0

    move/from16 v0, v32

    move-object/from16 v1, p0

    iput-boolean v0, v1, Landroid/widget/GridView;->mDataChanged:Z

    .line 1382
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/GridView;->mPositionScrollAfterLayout:Ljava/lang/Runnable;

    move-object/from16 v32, v0

    if-eqz v32, :cond_f

    .line 1383
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/GridView;->mPositionScrollAfterLayout:Ljava/lang/Runnable;

    move-object/from16 v32, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Landroid/widget/GridView;->post(Ljava/lang/Runnable;)Z

    .line 1384
    const/16 v32, 0x0

    move-object/from16 v0, v32

    move-object/from16 v1, p0

    iput-object v0, v1, Landroid/widget/GridView;->mPositionScrollAfterLayout:Ljava/lang/Runnable;

    .line 1386
    :cond_f
    const/16 v32, 0x0

    move/from16 v0, v32

    move-object/from16 v1, p0

    iput-boolean v0, v1, Landroid/widget/GridView;->mNeedSync:Z

    .line 1387
    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mSelectedPosition:I

    move/from16 v32, v0

    move-object/from16 v0, p0

    move/from16 v1, v32

    invoke-virtual {v0, v1}, Landroid/widget/GridView;->setNextSelectedPositionInt(I)V

    .line 1389
    invoke-virtual/range {p0 .. p0}, Landroid/widget/GridView;->updateScrollIndicators()V

    .line 1391
    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mItemCount:I

    move/from16 v32, v0

    if-lez v32, :cond_10

    .line 1392
    invoke-virtual/range {p0 .. p0}, Landroid/widget/GridView;->checkSelectionChanged()V

    .line 1395
    :cond_10
    invoke-virtual/range {p0 .. p0}, Landroid/widget/GridView;->invokeOnItemScrollListener()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1397
    if-nez v7, :cond_1

    .line 1398
    const/16 v32, 0x0

    move/from16 v0, v32

    move-object/from16 v1, p0

    iput-boolean v0, v1, Landroid/widget/GridView;->mBlockLayoutRequests:Z

    goto/16 :goto_0

    .line 1270
    .end local v29    # "sel":Landroid/view/View;
    .restart local v11    # "childrenTop":I
    :pswitch_3
    if-eqz v22, :cond_11

    .line 1271
    :try_start_3
    invoke-virtual/range {v22 .. v22}, Landroid/view/View;->getTop()I

    move-result v32

    move-object/from16 v0, p0

    move/from16 v1, v32

    invoke-direct {v0, v1, v11, v10}, Landroid/widget/GridView;->fillFromSelection(III)Landroid/view/View;

    move-result-object v29

    .restart local v29    # "sel":Landroid/view/View;
    goto/16 :goto_4

    .line 1273
    .end local v29    # "sel":Landroid/view/View;
    :cond_11
    move-object/from16 v0, p0

    invoke-direct {v0, v11, v10}, Landroid/widget/GridView;->fillSelection(II)Landroid/view/View;

    move-result-object v29

    .line 1275
    .restart local v29    # "sel":Landroid/view/View;
    goto/16 :goto_4

    .line 1277
    .end local v29    # "sel":Landroid/view/View;
    :pswitch_4
    const/16 v32, 0x0

    move/from16 v0, v32

    move-object/from16 v1, p0

    iput v0, v1, Landroid/widget/GridView;->mFirstPosition:I

    .line 1278
    move-object/from16 v0, p0

    invoke-direct {v0, v11}, Landroid/widget/GridView;->fillFromTop(I)Landroid/view/View;

    move-result-object v29

    .line 1279
    .restart local v29    # "sel":Landroid/view/View;
    invoke-direct/range {p0 .. p0}, Landroid/widget/GridView;->adjustViewsUpOrDown()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto/16 :goto_4

    .line 1397
    .end local v4    # "accessibilityFocusLayoutRestoreNode":Landroid/view/accessibility/AccessibilityNodeInfo;
    .end local v5    # "accessibilityFocusLayoutRestoreView":Landroid/view/View;
    .end local v6    # "accessibilityFocusPosition":I
    .end local v9    # "childCount":I
    .end local v10    # "childrenBottom":I
    .end local v11    # "childrenTop":I
    .end local v12    # "dataChanged":Z
    .end local v13    # "delta":I
    .end local v14    # "firstPosition":I
    .end local v22    # "newSel":Landroid/view/View;
    .end local v23    # "oldFirst":Landroid/view/View;
    .end local v24    # "oldSel":Landroid/view/View;
    .end local v27    # "recycleBin":Landroid/widget/AbsListView$RecycleBin;
    .end local v29    # "sel":Landroid/view/View;
    .end local v30    # "viewRootImpl":Landroid/view/ViewRootImpl;
    :catchall_0
    move-exception v32

    if-nez v7, :cond_12

    .line 1398
    const/16 v33, 0x0

    move/from16 v0, v33

    move-object/from16 v1, p0

    iput-boolean v0, v1, Landroid/widget/GridView;->mBlockLayoutRequests:Z

    :cond_12
    throw v32

    .line 1282
    .restart local v4    # "accessibilityFocusLayoutRestoreNode":Landroid/view/accessibility/AccessibilityNodeInfo;
    .restart local v5    # "accessibilityFocusLayoutRestoreView":Landroid/view/View;
    .restart local v6    # "accessibilityFocusPosition":I
    .restart local v9    # "childCount":I
    .restart local v10    # "childrenBottom":I
    .restart local v11    # "childrenTop":I
    .restart local v12    # "dataChanged":Z
    .restart local v13    # "delta":I
    .restart local v14    # "firstPosition":I
    .restart local v22    # "newSel":Landroid/view/View;
    .restart local v23    # "oldFirst":Landroid/view/View;
    .restart local v24    # "oldSel":Landroid/view/View;
    .restart local v27    # "recycleBin":Landroid/widget/AbsListView$RecycleBin;
    .restart local v30    # "viewRootImpl":Landroid/view/ViewRootImpl;
    :pswitch_5
    :try_start_4
    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mItemCount:I

    move/from16 v32, v0

    add-int/lit8 v32, v32, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v32

    invoke-direct {v0, v1, v10}, Landroid/widget/GridView;->fillUp(II)Landroid/view/View;

    move-result-object v29

    .line 1283
    .restart local v29    # "sel":Landroid/view/View;
    invoke-direct/range {p0 .. p0}, Landroid/widget/GridView;->adjustViewsUpOrDown()V

    goto/16 :goto_4

    .line 1286
    .end local v29    # "sel":Landroid/view/View;
    :pswitch_6
    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mSelectedPosition:I

    move/from16 v32, v0

    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mSpecificTop:I

    move/from16 v33, v0

    move-object/from16 v0, p0

    move/from16 v1, v32

    move/from16 v2, v33

    invoke-direct {v0, v1, v2}, Landroid/widget/GridView;->fillSpecific(II)Landroid/view/View;

    move-result-object v29

    .line 1287
    .restart local v29    # "sel":Landroid/view/View;
    goto/16 :goto_4

    .line 1289
    .end local v29    # "sel":Landroid/view/View;
    :pswitch_7
    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mSyncPosition:I

    move/from16 v32, v0

    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mSpecificTop:I

    move/from16 v33, v0

    move-object/from16 v0, p0

    move/from16 v1, v32

    move/from16 v2, v33

    invoke-direct {v0, v1, v2}, Landroid/widget/GridView;->fillSpecific(II)Landroid/view/View;

    move-result-object v29

    .line 1290
    .restart local v29    # "sel":Landroid/view/View;
    goto/16 :goto_4

    .line 1293
    .end local v29    # "sel":Landroid/view/View;
    :pswitch_8
    move-object/from16 v0, p0

    invoke-direct {v0, v13, v11, v10}, Landroid/widget/GridView;->moveSelection(III)Landroid/view/View;

    move-result-object v29

    .line 1294
    .restart local v29    # "sel":Landroid/view/View;
    goto/16 :goto_4

    .line 1298
    .end local v29    # "sel":Landroid/view/View;
    :cond_13
    const/16 v32, 0x0

    goto/16 :goto_3

    .line 1302
    :cond_14
    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mItemCount:I

    move/from16 v32, v0

    add-int/lit8 v20, v32, -0x1

    .line 1303
    .local v20, "last":I
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/GridView;->mAdapter:Landroid/widget/ListAdapter;

    move-object/from16 v32, v0

    if-eqz v32, :cond_15

    invoke-virtual/range {p0 .. p0}, Landroid/widget/GridView;->isInTouchMode()Z

    move-result v32

    if-eqz v32, :cond_16

    :cond_15
    const/16 v32, -0x1

    :goto_7
    move-object/from16 v0, p0

    move/from16 v1, v32

    invoke-virtual {v0, v1}, Landroid/widget/GridView;->setSelectedPositionInt(I)V

    .line 1305
    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-direct {v0, v1, v10}, Landroid/widget/GridView;->fillFromBottom(II)Landroid/view/View;

    move-result-object v29

    .line 1306
    .restart local v29    # "sel":Landroid/view/View;
    goto/16 :goto_4

    .end local v29    # "sel":Landroid/view/View;
    :cond_16
    move/from16 v32, v20

    .line 1303
    goto :goto_7

    .line 1308
    .end local v20    # "last":I
    :cond_17
    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mSelectedPosition:I

    move/from16 v32, v0

    if-ltz v32, :cond_19

    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mSelectedPosition:I

    move/from16 v32, v0

    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mItemCount:I

    move/from16 v33, v0

    move/from16 v0, v32

    move/from16 v1, v33

    if-ge v0, v1, :cond_19

    .line 1309
    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mSelectedPosition:I

    move/from16 v32, v0

    if-nez v24, :cond_18

    .end local v11    # "childrenTop":I
    :goto_8
    move-object/from16 v0, p0

    move/from16 v1, v32

    invoke-direct {v0, v1, v11}, Landroid/widget/GridView;->fillSpecific(II)Landroid/view/View;

    move-result-object v29

    .restart local v29    # "sel":Landroid/view/View;
    goto/16 :goto_4

    .end local v29    # "sel":Landroid/view/View;
    .restart local v11    # "childrenTop":I
    :cond_18
    invoke-virtual/range {v24 .. v24}, Landroid/view/View;->getTop()I

    move-result v11

    goto :goto_8

    .line 1311
    :cond_19
    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mFirstPosition:I

    move/from16 v32, v0

    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mItemCount:I

    move/from16 v33, v0

    move/from16 v0, v32

    move/from16 v1, v33

    if-ge v0, v1, :cond_1b

    .line 1312
    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mFirstPosition:I

    move/from16 v32, v0

    if-nez v23, :cond_1a

    .end local v11    # "childrenTop":I
    :goto_9
    move-object/from16 v0, p0

    move/from16 v1, v32

    invoke-direct {v0, v1, v11}, Landroid/widget/GridView;->fillSpecific(II)Landroid/view/View;

    move-result-object v29

    .restart local v29    # "sel":Landroid/view/View;
    goto/16 :goto_4

    .end local v29    # "sel":Landroid/view/View;
    .restart local v11    # "childrenTop":I
    :cond_1a
    invoke-virtual/range {v23 .. v23}, Landroid/view/View;->getTop()I

    move-result v11

    goto :goto_9

    .line 1315
    :cond_1b
    const/16 v32, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v32

    invoke-direct {v0, v1, v11}, Landroid/widget/GridView;->fillSpecific(II)Landroid/view/View;

    move-result-object v29

    .restart local v29    # "sel":Landroid/view/View;
    goto/16 :goto_4

    .line 1328
    .end local v11    # "childrenTop":I
    :cond_1c
    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mTouchMode:I

    move/from16 v32, v0

    if-lez v32, :cond_1d

    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mTouchMode:I

    move/from16 v32, v0

    const/16 v33, 0x3

    move/from16 v0, v32

    move/from16 v1, v33

    if-ge v0, v1, :cond_1d

    const/16 v18, 0x1

    .line 1330
    .local v18, "inTouchMode":Z
    :goto_a
    if-eqz v18, :cond_1e

    .line 1332
    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mMotionPosition:I

    move/from16 v32, v0

    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mFirstPosition:I

    move/from16 v33, v0

    sub-int v32, v32, v33

    move-object/from16 v0, p0

    move/from16 v1, v32

    invoke-virtual {v0, v1}, Landroid/widget/GridView;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    .line 1333
    .local v8, "child":Landroid/view/View;
    if-eqz v8, :cond_d

    .line 1334
    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mMotionPosition:I

    move/from16 v32, v0

    move-object/from16 v0, p0

    move/from16 v1, v32

    invoke-virtual {v0, v1, v8}, Landroid/widget/GridView;->positionSelector(ILandroid/view/View;)V

    goto/16 :goto_5

    .line 1328
    .end local v8    # "child":Landroid/view/View;
    .end local v18    # "inTouchMode":Z
    :cond_1d
    const/16 v18, 0x0

    goto :goto_a

    .line 1336
    .restart local v18    # "inTouchMode":Z
    :cond_1e
    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mSelectedPosition:I

    move/from16 v32, v0

    const/16 v33, -0x1

    move/from16 v0, v32

    move/from16 v1, v33

    if-eq v0, v1, :cond_1f

    .line 1340
    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mSelectorPosition:I

    move/from16 v32, v0

    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mFirstPosition:I

    move/from16 v33, v0

    sub-int v32, v32, v33

    move-object/from16 v0, p0

    move/from16 v1, v32

    invoke-virtual {v0, v1}, Landroid/widget/GridView;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    .line 1341
    .restart local v8    # "child":Landroid/view/View;
    if-eqz v8, :cond_d

    .line 1342
    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mSelectorPosition:I

    move/from16 v32, v0

    move-object/from16 v0, p0

    move/from16 v1, v32

    invoke-virtual {v0, v1, v8}, Landroid/widget/GridView;->positionSelector(ILandroid/view/View;)V

    goto/16 :goto_5

    .line 1346
    .end local v8    # "child":Landroid/view/View;
    :cond_1f
    const/16 v32, 0x0

    move/from16 v0, v32

    move-object/from16 v1, p0

    iput v0, v1, Landroid/widget/GridView;->mSelectedTop:I

    .line 1347
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/GridView;->mSelectorRect:Landroid/graphics/Rect;

    move-object/from16 v32, v0

    invoke-virtual/range {v32 .. v32}, Landroid/graphics/Rect;->setEmpty()V

    goto/16 :goto_5

    .line 1365
    .end local v18    # "inTouchMode":Z
    .restart local v21    # "newAccessibilityFocusedView":Landroid/view/View;
    .restart local v26    # "provider":Landroid/view/accessibility/AccessibilityNodeProvider;
    :cond_20
    invoke-virtual {v5}, Landroid/view/View;->requestAccessibilityFocus()Z

    goto/16 :goto_6

    .line 1367
    .end local v26    # "provider":Landroid/view/accessibility/AccessibilityNodeProvider;
    :cond_21
    const/16 v32, -0x1

    move/from16 v0, v32

    if-eq v6, v0, :cond_e

    .line 1369
    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mFirstPosition:I

    move/from16 v32, v0

    sub-int v32, v6, v32

    const/16 v33, 0x0

    invoke-virtual/range {p0 .. p0}, Landroid/widget/GridView;->getChildCount()I

    move-result v34

    add-int/lit8 v34, v34, -0x1

    invoke-static/range {v32 .. v34}, Landroid/util/MathUtils;->constrain(III)I

    move-result v25

    .line 1372
    .local v25, "position":I
    move-object/from16 v0, p0

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Landroid/widget/GridView;->getChildAt(I)Landroid/view/View;

    move-result-object v28

    .line 1373
    .local v28, "restoreView":Landroid/view/View;
    if-eqz v28, :cond_e

    .line 1374
    invoke-virtual/range {v28 .. v28}, Landroid/view/View;->requestAccessibilityFocus()Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto/16 :goto_6

    .line 1180
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_2
    .end packed-switch

    .line 1268
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
    .end packed-switch
.end method

.method lookForSelectablePosition(IZ)I
    .locals 3
    .param p1, "position"    # I
    .param p2, "lookDown"    # Z

    .prologue
    const/4 v1, -0x1

    .line 232
    iget-object v0, p0, Landroid/widget/GridView;->mAdapter:Landroid/widget/ListAdapter;

    .line 233
    .local v0, "adapter":Landroid/widget/ListAdapter;
    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroid/widget/GridView;->isInTouchMode()Z

    move-result v2

    if-eqz v2, :cond_2

    :cond_0
    move p1, v1

    .line 240
    .end local p1    # "position":I
    :cond_1
    :goto_0
    return p1

    .line 237
    .restart local p1    # "position":I
    :cond_2
    if-ltz p1, :cond_3

    iget v2, p0, Landroid/widget/GridView;->mItemCount:I

    if-lt p1, v2, :cond_1

    :cond_3
    move p1, v1

    .line 238
    goto :goto_0
.end method

.method protected onFocusChanged(ZILandroid/graphics/Rect;)V
    .locals 9
    .param p1, "gainFocus"    # Z
    .param p2, "direction"    # I
    .param p3, "previouslyFocusedRect"    # Landroid/graphics/Rect;

    .prologue
    .line 1952
    invoke-super {p0, p1, p2, p3}, Landroid/widget/AbsListView;->onFocusChanged(ZILandroid/graphics/Rect;)V

    .line 1954
    const/4 v1, -0x1

    .line 1955
    .local v1, "closestChildIndex":I
    if-eqz p1, :cond_2

    if-eqz p3, :cond_2

    .line 1956
    iget v7, p0, Landroid/widget/GridView;->mScrollX:I

    iget v8, p0, Landroid/widget/GridView;->mScrollY:I

    invoke-virtual {p3, v7, v8}, Landroid/graphics/Rect;->offset(II)V

    .line 1960
    iget-object v6, p0, Landroid/widget/GridView;->mTempRect:Landroid/graphics/Rect;

    .line 1961
    .local v6, "otherRect":Landroid/graphics/Rect;
    const v4, 0x7fffffff

    .line 1962
    .local v4, "minDistance":I
    invoke-virtual {p0}, Landroid/widget/GridView;->getChildCount()I

    move-result v0

    .line 1963
    .local v0, "childCount":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v0, :cond_2

    .line 1965
    invoke-direct {p0, v3, p2}, Landroid/widget/GridView;->isCandidateSelection(II)Z

    move-result v7

    if-nez v7, :cond_1

    .line 1963
    :cond_0
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1969
    :cond_1
    invoke-virtual {p0, v3}, Landroid/widget/GridView;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 1970
    .local v5, "other":Landroid/view/View;
    invoke-virtual {v5, v6}, Landroid/view/View;->getDrawingRect(Landroid/graphics/Rect;)V

    .line 1971
    invoke-virtual {p0, v5, v6}, Landroid/widget/GridView;->offsetDescendantRectToMyCoords(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 1972
    invoke-static {p3, v6, p2}, Landroid/widget/GridView;->getDistance(Landroid/graphics/Rect;Landroid/graphics/Rect;I)I

    move-result v2

    .line 1974
    .local v2, "distance":I
    if-ge v2, v4, :cond_0

    .line 1975
    move v4, v2

    .line 1976
    move v1, v3

    goto :goto_1

    .line 1981
    .end local v0    # "childCount":I
    .end local v2    # "distance":I
    .end local v3    # "i":I
    .end local v4    # "minDistance":I
    .end local v5    # "other":Landroid/view/View;
    .end local v6    # "otherRect":Landroid/graphics/Rect;
    :cond_2
    if-ltz v1, :cond_3

    .line 1982
    iget v7, p0, Landroid/widget/GridView;->mFirstPosition:I

    add-int/2addr v7, v1

    invoke-virtual {p0, v7}, Landroid/widget/GridView;->setSelection(I)V

    .line 1986
    :goto_2
    return-void

    .line 1984
    :cond_3
    invoke-virtual {p0}, Landroid/widget/GridView;->requestLayout()V

    goto :goto_2
.end method

.method public onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 1
    .param p1, "event"    # Landroid/view/accessibility/AccessibilityEvent;

    .prologue
    .line 2357
    invoke-super {p0, p1}, Landroid/widget/AbsListView;->onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 2358
    const-class v0, Landroid/widget/GridView;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityEvent;->setClassName(Ljava/lang/CharSequence;)V

    .line 2359
    return-void
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 5
    .param p1, "info"    # Landroid/view/accessibility/AccessibilityNodeInfo;

    .prologue
    .line 2363
    invoke-super {p0, p1}, Landroid/widget/AbsListView;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 2364
    const-class v4, Landroid/widget/GridView;

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClassName(Ljava/lang/CharSequence;)V

    .line 2366
    invoke-virtual {p0}, Landroid/widget/GridView;->getNumColumns()I

    move-result v1

    .line 2367
    .local v1, "columnsCount":I
    invoke-virtual {p0}, Landroid/widget/GridView;->getCount()I

    move-result v4

    div-int v2, v4, v1

    .line 2368
    .local v2, "rowsCount":I
    invoke-virtual {p0}, Landroid/widget/GridView;->getSelectionModeForAccessibility()I

    move-result v3

    .line 2369
    .local v3, "selectionMode":I
    const/4 v4, 0x0

    invoke-static {v2, v1, v4, v3}, Landroid/view/accessibility/AccessibilityNodeInfo$CollectionInfo;->obtain(IIZI)Landroid/view/accessibility/AccessibilityNodeInfo$CollectionInfo;

    move-result-object v0

    .line 2371
    .local v0, "collectionInfo":Landroid/view/accessibility/AccessibilityNodeInfo$CollectionInfo;
    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setCollectionInfo(Landroid/view/accessibility/AccessibilityNodeInfo$CollectionInfo;)V

    .line 2372
    return-void
.end method

.method public onInitializeAccessibilityNodeInfoForItem(Landroid/view/View;ILandroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 12
    .param p1, "view"    # Landroid/view/View;
    .param p2, "position"    # I
    .param p3, "info"    # Landroid/view/accessibility/AccessibilityNodeInfo;

    .prologue
    .line 2377
    invoke-super {p0, p1, p2, p3}, Landroid/widget/AbsListView;->onInitializeAccessibilityNodeInfoForItem(Landroid/view/View;ILandroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 2379
    invoke-virtual {p0}, Landroid/widget/GridView;->getCount()I

    move-result v7

    .line 2380
    .local v7, "count":I
    invoke-virtual {p0}, Landroid/widget/GridView;->getNumColumns()I

    move-result v6

    .line 2381
    .local v6, "columnsCount":I
    div-int v11, v7, v6

    .line 2385
    .local v11, "rowsCount":I
    iget-boolean v1, p0, Landroid/widget/GridView;->mStackFromBottom:Z

    if-nez v1, :cond_0

    .line 2386
    rem-int v2, p2, v6

    .line 2387
    .local v2, "column":I
    div-int v0, p2, v6

    .line 2395
    .local v0, "row":I
    :goto_0
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v10

    check-cast v10, Landroid/widget/AbsListView$LayoutParams;

    .line 2396
    .local v10, "lp":Landroid/widget/AbsListView$LayoutParams;
    if-eqz v10, :cond_1

    iget v1, v10, Landroid/widget/AbsListView$LayoutParams;->viewType:I

    const/4 v3, -0x2

    if-eq v1, v3, :cond_1

    const/4 v4, 0x1

    .line 2397
    .local v4, "isHeading":Z
    :goto_1
    invoke-virtual {p0, p2}, Landroid/widget/GridView;->isItemChecked(I)Z

    move-result v5

    .line 2398
    .local v5, "isSelected":Z
    const/4 v1, 0x1

    const/4 v3, 0x1

    invoke-static/range {v0 .. v5}, Landroid/view/accessibility/AccessibilityNodeInfo$CollectionItemInfo;->obtain(IIIIZZ)Landroid/view/accessibility/AccessibilityNodeInfo$CollectionItemInfo;

    move-result-object v9

    .line 2400
    .local v9, "itemInfo":Landroid/view/accessibility/AccessibilityNodeInfo$CollectionItemInfo;
    invoke-virtual {p3, v9}, Landroid/view/accessibility/AccessibilityNodeInfo;->setCollectionItemInfo(Landroid/view/accessibility/AccessibilityNodeInfo$CollectionItemInfo;)V

    .line 2401
    return-void

    .line 2389
    .end local v0    # "row":I
    .end local v2    # "column":I
    .end local v4    # "isHeading":Z
    .end local v5    # "isSelected":Z
    .end local v9    # "itemInfo":Landroid/view/accessibility/AccessibilityNodeInfo$CollectionItemInfo;
    .end local v10    # "lp":Landroid/widget/AbsListView$LayoutParams;
    :cond_0
    add-int/lit8 v1, v7, -0x1

    sub-int v8, v1, p2

    .line 2391
    .local v8, "invertedIndex":I
    add-int/lit8 v1, v6, -0x1

    rem-int v3, v8, v6

    sub-int v2, v1, v3

    .line 2392
    .restart local v2    # "column":I
    add-int/lit8 v1, v11, -0x1

    div-int v3, v8, v6

    sub-int v0, v1, v3

    .restart local v0    # "row":I
    goto :goto_0

    .line 2396
    .end local v8    # "invertedIndex":I
    .restart local v10    # "lp":Landroid/widget/AbsListView$LayoutParams;
    :cond_1
    const/4 v4, 0x0

    goto :goto_1
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 1616
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0, p2}, Landroid/widget/GridView;->commonKey(IILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method public onKeyMultiple(IILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "repeatCount"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 1621
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/GridView;->commonKey(IILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 1626
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0, p2}, Landroid/widget/GridView;->commonKey(IILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method protected onMeasure(II)V
    .locals 22
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 1037
    invoke-super/range {p0 .. p2}, Landroid/widget/AbsListView;->onMeasure(II)V

    .line 1039
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v17

    .line 1040
    .local v17, "widthMode":I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v11

    .line 1041
    .local v11, "heightMode":I
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v18

    .line 1042
    .local v18, "widthSize":I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v12

    .line 1044
    .local v12, "heightSize":I
    if-nez v17, :cond_0

    .line 1045
    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mColumnWidth:I

    move/from16 v19, v0

    if-lez v19, :cond_9

    .line 1046
    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mColumnWidth:I

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/GridView;->mListPadding:Landroid/graphics/Rect;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget v0, v0, Landroid/graphics/Rect;->left:I

    move/from16 v20, v0

    add-int v19, v19, v20

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/GridView;->mListPadding:Landroid/graphics/Rect;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget v0, v0, Landroid/graphics/Rect;->right:I

    move/from16 v20, v0

    add-int v18, v19, v20

    .line 1050
    :goto_0
    invoke-virtual/range {p0 .. p0}, Landroid/widget/GridView;->getVerticalScrollbarWidth()I

    move-result v19

    add-int v18, v18, v19

    .line 1053
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/GridView;->mListPadding:Landroid/graphics/Rect;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget v0, v0, Landroid/graphics/Rect;->left:I

    move/from16 v19, v0

    sub-int v19, v18, v19

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/GridView;->mListPadding:Landroid/graphics/Rect;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget v0, v0, Landroid/graphics/Rect;->right:I

    move/from16 v20, v0

    sub-int v7, v19, v20

    .line 1054
    .local v7, "childWidth":I
    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Landroid/widget/GridView;->determineColumns(I)Z

    move-result v10

    .line 1056
    .local v10, "didNotInitiallyFit":Z
    const/4 v4, 0x0

    .line 1057
    .local v4, "childHeight":I
    const/4 v6, 0x0

    .line 1059
    .local v6, "childState":I
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/GridView;->mAdapter:Landroid/widget/ListAdapter;

    move-object/from16 v19, v0

    if-nez v19, :cond_a

    const/16 v19, 0x0

    :goto_1
    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Landroid/widget/GridView;->mItemCount:I

    .line 1060
    move-object/from16 v0, p0

    iget v9, v0, Landroid/widget/GridView;->mItemCount:I

    .line 1061
    .local v9, "count":I
    if-lez v9, :cond_2

    .line 1062
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/GridView;->mIsScrap:[Z

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    move/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Landroid/widget/GridView;->obtainView(I[Z)Landroid/view/View;

    move-result-object v3

    .line 1064
    .local v3, "child":Landroid/view/View;
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v16

    check-cast v16, Landroid/widget/AbsListView$LayoutParams;

    .line 1065
    .local v16, "p":Landroid/widget/AbsListView$LayoutParams;
    if-nez v16, :cond_1

    .line 1066
    invoke-virtual/range {p0 .. p0}, Landroid/widget/GridView;->generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v16

    .end local v16    # "p":Landroid/widget/AbsListView$LayoutParams;
    check-cast v16, Landroid/widget/AbsListView$LayoutParams;

    .line 1067
    .restart local v16    # "p":Landroid/widget/AbsListView$LayoutParams;
    move-object/from16 v0, v16

    invoke-virtual {v3, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1069
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/GridView;->mAdapter:Landroid/widget/ListAdapter;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    invoke-interface/range {v19 .. v20}, Landroid/widget/ListAdapter;->getItemViewType(I)I

    move-result v19

    move/from16 v0, v19

    move-object/from16 v1, v16

    iput v0, v1, Landroid/widget/AbsListView$LayoutParams;->viewType:I

    .line 1070
    const/16 v19, 0x1

    move/from16 v0, v19

    move-object/from16 v1, v16

    iput-boolean v0, v1, Landroid/widget/AbsListView$LayoutParams;->forceAdd:Z

    .line 1072
    const/16 v19, 0x0

    const/16 v20, 0x0

    invoke-static/range {v19 .. v20}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v19

    const/16 v20, 0x0

    move-object/from16 v0, v16

    iget v0, v0, Landroid/widget/AbsListView$LayoutParams;->height:I

    move/from16 v21, v0

    invoke-static/range {v19 .. v21}, Landroid/widget/GridView;->getChildMeasureSpec(III)I

    move-result v5

    .line 1074
    .local v5, "childHeightSpec":I
    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mColumnWidth:I

    move/from16 v19, v0

    const/high16 v20, 0x40000000    # 2.0f

    invoke-static/range {v19 .. v20}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v19

    const/16 v20, 0x0

    move-object/from16 v0, v16

    iget v0, v0, Landroid/widget/AbsListView$LayoutParams;->width:I

    move/from16 v21, v0

    invoke-static/range {v19 .. v21}, Landroid/widget/GridView;->getChildMeasureSpec(III)I

    move-result v8

    .line 1076
    .local v8, "childWidthSpec":I
    invoke-virtual {v3, v8, v5}, Landroid/view/View;->measure(II)V

    .line 1078
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    move-result v4

    .line 1079
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredState()I

    move-result v19

    move/from16 v0, v19

    invoke-static {v6, v0}, Landroid/widget/GridView;->combineMeasuredStates(II)I

    move-result v6

    .line 1081
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/GridView;->mRecycler:Landroid/widget/AbsListView$RecycleBin;

    move-object/from16 v19, v0

    move-object/from16 v0, v16

    iget v0, v0, Landroid/widget/AbsListView$LayoutParams;->viewType:I

    move/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Landroid/widget/AbsListView$RecycleBin;->shouldRecycleViewType(I)Z

    move-result v19

    if-eqz v19, :cond_2

    .line 1082
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/GridView;->mRecycler:Landroid/widget/AbsListView$RecycleBin;

    move-object/from16 v19, v0

    const/16 v20, -0x1

    move-object/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v0, v3, v1}, Landroid/widget/AbsListView$RecycleBin;->addScrapView(Landroid/view/View;I)V

    .line 1086
    .end local v3    # "child":Landroid/view/View;
    .end local v5    # "childHeightSpec":I
    .end local v8    # "childWidthSpec":I
    .end local v16    # "p":Landroid/widget/AbsListView$LayoutParams;
    :cond_2
    if-nez v11, :cond_3

    .line 1087
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/GridView;->mListPadding:Landroid/graphics/Rect;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget v0, v0, Landroid/graphics/Rect;->top:I

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/GridView;->mListPadding:Landroid/graphics/Rect;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    move/from16 v20, v0

    add-int v19, v19, v20

    add-int v19, v19, v4

    invoke-virtual/range {p0 .. p0}, Landroid/widget/GridView;->getVerticalFadingEdgeLength()I

    move-result v20

    mul-int/lit8 v20, v20, 0x2

    add-int v12, v19, v20

    .line 1091
    :cond_3
    const/high16 v19, -0x80000000

    move/from16 v0, v19

    if-ne v11, v0, :cond_6

    .line 1092
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/GridView;->mListPadding:Landroid/graphics/Rect;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget v0, v0, Landroid/graphics/Rect;->top:I

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/GridView;->mListPadding:Landroid/graphics/Rect;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    move/from16 v20, v0

    add-int v15, v19, v20

    .line 1094
    .local v15, "ourSize":I
    move-object/from16 v0, p0

    iget v14, v0, Landroid/widget/GridView;->mNumColumns:I

    .line 1095
    .local v14, "numColumns":I
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_2
    if-ge v13, v9, :cond_5

    .line 1096
    add-int/2addr v15, v4

    .line 1097
    add-int v19, v13, v14

    move/from16 v0, v19

    if-ge v0, v9, :cond_4

    .line 1098
    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mVerticalSpacing:I

    move/from16 v19, v0

    add-int v15, v15, v19

    .line 1100
    :cond_4
    if-lt v15, v12, :cond_b

    .line 1101
    move v15, v12

    .line 1105
    :cond_5
    move v12, v15

    .line 1108
    .end local v13    # "i":I
    .end local v14    # "numColumns":I
    .end local v15    # "ourSize":I
    :cond_6
    const/high16 v19, -0x80000000

    move/from16 v0, v17

    move/from16 v1, v19

    if-ne v0, v1, :cond_8

    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mRequestedNumColumns:I

    move/from16 v19, v0

    const/16 v20, -0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-eq v0, v1, :cond_8

    .line 1109
    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mRequestedNumColumns:I

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mColumnWidth:I

    move/from16 v20, v0

    mul-int v19, v19, v20

    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mRequestedNumColumns:I

    move/from16 v20, v0

    add-int/lit8 v20, v20, -0x1

    move-object/from16 v0, p0

    iget v0, v0, Landroid/widget/GridView;->mHorizontalSpacing:I

    move/from16 v21, v0

    mul-int v20, v20, v21

    add-int v19, v19, v20

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/GridView;->mListPadding:Landroid/graphics/Rect;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget v0, v0, Landroid/graphics/Rect;->left:I

    move/from16 v20, v0

    add-int v19, v19, v20

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/GridView;->mListPadding:Landroid/graphics/Rect;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget v0, v0, Landroid/graphics/Rect;->right:I

    move/from16 v20, v0

    add-int v15, v19, v20

    .line 1112
    .restart local v15    # "ourSize":I
    move/from16 v0, v18

    if-gt v15, v0, :cond_7

    if-eqz v10, :cond_8

    .line 1113
    :cond_7
    const/high16 v19, 0x1000000

    or-int v18, v18, v19

    .line 1117
    .end local v15    # "ourSize":I
    :cond_8
    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1, v12}, Landroid/widget/GridView;->setMeasuredDimension(II)V

    .line 1118
    move/from16 v0, p1

    move-object/from16 v1, p0

    iput v0, v1, Landroid/widget/GridView;->mWidthMeasureSpec:I

    .line 1119
    return-void

    .line 1048
    .end local v4    # "childHeight":I
    .end local v6    # "childState":I
    .end local v7    # "childWidth":I
    .end local v9    # "count":I
    .end local v10    # "didNotInitiallyFit":Z
    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/GridView;->mListPadding:Landroid/graphics/Rect;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget v0, v0, Landroid/graphics/Rect;->left:I

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/GridView;->mListPadding:Landroid/graphics/Rect;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget v0, v0, Landroid/graphics/Rect;->right:I

    move/from16 v20, v0

    add-int v18, v19, v20

    goto/16 :goto_0

    .line 1059
    .restart local v4    # "childHeight":I
    .restart local v6    # "childState":I
    .restart local v7    # "childWidth":I
    .restart local v10    # "didNotInitiallyFit":Z
    :cond_a
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/GridView;->mAdapter:Landroid/widget/ListAdapter;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Landroid/widget/ListAdapter;->getCount()I

    move-result v19

    goto/16 :goto_1

    .line 1095
    .restart local v9    # "count":I
    .restart local v13    # "i":I
    .restart local v14    # "numColumns":I
    .restart local v15    # "ourSize":I
    :cond_b
    add-int/2addr v13, v14

    goto/16 :goto_2
.end method

.method pageScroll(I)Z
    .locals 5
    .param p1, "direction"    # I

    .prologue
    const/4 v1, 0x0

    .line 1768
    const/4 v0, -0x1

    .line 1770
    .local v0, "nextPage":I
    const/16 v2, 0x21

    if-ne p1, v2, :cond_2

    .line 1771
    iget v2, p0, Landroid/widget/GridView;->mSelectedPosition:I

    invoke-virtual {p0}, Landroid/widget/GridView;->getChildCount()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 1776
    :cond_0
    :goto_0
    if-ltz v0, :cond_1

    .line 1777
    invoke-virtual {p0, v0}, Landroid/widget/GridView;->setSelectionInt(I)V

    .line 1778
    invoke-virtual {p0}, Landroid/widget/GridView;->invokeOnItemScrollListener()V

    .line 1779
    invoke-virtual {p0}, Landroid/widget/GridView;->awakenScrollBars()Z

    .line 1780
    const/4 v1, 0x1

    .line 1783
    :cond_1
    return v1

    .line 1772
    :cond_2
    const/16 v2, 0x82

    if-ne p1, v2, :cond_0

    .line 1773
    iget v2, p0, Landroid/widget/GridView;->mItemCount:I

    add-int/lit8 v2, v2, -0x1

    iget v3, p0, Landroid/widget/GridView;->mSelectedPosition:I

    invoke-virtual {p0}, Landroid/widget/GridView;->getChildCount()I

    move-result v4

    add-int/2addr v3, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v0

    goto :goto_0
.end method

.method sequenceScroll(I)Z
    .locals 13
    .param p1, "direction"    # I

    .prologue
    const/4 v12, 0x6

    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 1897
    iget v5, p0, Landroid/widget/GridView;->mSelectedPosition:I

    .line 1898
    .local v5, "selectedPosition":I
    iget v4, p0, Landroid/widget/GridView;->mNumColumns:I

    .line 1899
    .local v4, "numColumns":I
    iget v0, p0, Landroid/widget/GridView;->mItemCount:I

    .line 1903
    .local v0, "count":I
    iget-boolean v10, p0, Landroid/widget/GridView;->mStackFromBottom:Z

    if-nez v10, :cond_3

    .line 1904
    div-int v10, v5, v4

    mul-int v7, v10, v4

    .line 1905
    .local v7, "startOfRow":I
    add-int v10, v7, v4

    add-int/lit8 v10, v10, -0x1

    add-int/lit8 v11, v0, -0x1

    invoke-static {v10, v11}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 1912
    .local v1, "endOfRow":I
    :goto_0
    const/4 v3, 0x0

    .line 1913
    .local v3, "moved":Z
    const/4 v6, 0x0

    .line 1914
    .local v6, "showScroll":Z
    packed-switch p1, :pswitch_data_0

    .line 1938
    :cond_0
    :goto_1
    if-eqz v3, :cond_1

    .line 1939
    invoke-static {p1}, Landroid/view/SoundEffectConstants;->getContantForFocusDirection(I)I

    move-result v8

    invoke-virtual {p0, v8}, Landroid/widget/GridView;->playSoundEffect(I)V

    .line 1940
    invoke-virtual {p0}, Landroid/widget/GridView;->invokeOnItemScrollListener()V

    .line 1943
    :cond_1
    if-eqz v6, :cond_2

    .line 1944
    invoke-virtual {p0}, Landroid/widget/GridView;->awakenScrollBars()Z

    .line 1947
    :cond_2
    return v3

    .line 1907
    .end local v1    # "endOfRow":I
    .end local v3    # "moved":Z
    .end local v6    # "showScroll":Z
    .end local v7    # "startOfRow":I
    :cond_3
    add-int/lit8 v10, v0, -0x1

    sub-int v2, v10, v5

    .line 1908
    .local v2, "invertedSelection":I
    add-int/lit8 v10, v0, -0x1

    div-int v11, v2, v4

    mul-int/2addr v11, v4

    sub-int v1, v10, v11

    .line 1909
    .restart local v1    # "endOfRow":I
    sub-int v10, v1, v4

    add-int/lit8 v10, v10, 0x1

    invoke-static {v9, v10}, Ljava/lang/Math;->max(II)I

    move-result v7

    .restart local v7    # "startOfRow":I
    goto :goto_0

    .line 1916
    .end local v2    # "invertedSelection":I
    .restart local v3    # "moved":Z
    .restart local v6    # "showScroll":Z
    :pswitch_0
    add-int/lit8 v10, v0, -0x1

    if-ge v5, v10, :cond_0

    .line 1918
    iput v12, p0, Landroid/widget/GridView;->mLayoutMode:I

    .line 1919
    add-int/lit8 v10, v5, 0x1

    invoke-virtual {p0, v10}, Landroid/widget/GridView;->setSelectionInt(I)V

    .line 1920
    const/4 v3, 0x1

    .line 1922
    if-ne v5, v1, :cond_4

    move v6, v8

    :goto_2
    goto :goto_1

    :cond_4
    move v6, v9

    goto :goto_2

    .line 1927
    :pswitch_1
    if-lez v5, :cond_0

    .line 1929
    iput v12, p0, Landroid/widget/GridView;->mLayoutMode:I

    .line 1930
    add-int/lit8 v10, v5, -0x1

    invoke-virtual {p0, v10}, Landroid/widget/GridView;->setSelectionInt(I)V

    .line 1931
    const/4 v3, 0x1

    .line 1933
    if-ne v5, v7, :cond_5

    move v6, v8

    :goto_3
    goto :goto_1

    :cond_5
    move v6, v9

    goto :goto_3

    .line 1914
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public bridge synthetic setAdapter(Landroid/widget/Adapter;)V
    .locals 0

    .prologue
    .line 60
    check-cast p1, Landroid/widget/ListAdapter;

    invoke-virtual {p0, p1}, Landroid/widget/GridView;->setAdapter(Landroid/widget/ListAdapter;)V

    return-void
.end method

.method public setAdapter(Landroid/widget/ListAdapter;)V
    .locals 6
    .param p1, "adapter"    # Landroid/widget/ListAdapter;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 187
    iget-object v1, p0, Landroid/widget/GridView;->mAdapter:Landroid/widget/ListAdapter;

    if-eqz v1, :cond_0

    iget-object v1, p0, Landroid/widget/GridView;->mDataSetObserver:Landroid/widget/AbsListView$AdapterDataSetObserver;

    if-eqz v1, :cond_0

    .line 188
    iget-object v1, p0, Landroid/widget/GridView;->mAdapter:Landroid/widget/ListAdapter;

    iget-object v2, p0, Landroid/widget/GridView;->mDataSetObserver:Landroid/widget/AbsListView$AdapterDataSetObserver;

    invoke-interface {v1, v2}, Landroid/widget/ListAdapter;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 191
    :cond_0
    invoke-virtual {p0}, Landroid/widget/GridView;->resetList()V

    .line 192
    iget-object v1, p0, Landroid/widget/GridView;->mRecycler:Landroid/widget/AbsListView$RecycleBin;

    invoke-virtual {v1}, Landroid/widget/AbsListView$RecycleBin;->clear()V

    .line 193
    iput-object p1, p0, Landroid/widget/GridView;->mAdapter:Landroid/widget/ListAdapter;

    .line 195
    const/4 v1, -0x1

    iput v1, p0, Landroid/widget/GridView;->mOldSelectedPosition:I

    .line 196
    const-wide/high16 v2, -0x8000000000000000L

    iput-wide v2, p0, Landroid/widget/GridView;->mOldSelectedRowId:J

    .line 199
    invoke-super {p0, p1}, Landroid/widget/AbsListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 201
    iget-object v1, p0, Landroid/widget/GridView;->mAdapter:Landroid/widget/ListAdapter;

    if-eqz v1, :cond_2

    .line 202
    iget v1, p0, Landroid/widget/GridView;->mItemCount:I

    iput v1, p0, Landroid/widget/GridView;->mOldItemCount:I

    .line 203
    iget-object v1, p0, Landroid/widget/GridView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v1}, Landroid/widget/ListAdapter;->getCount()I

    move-result v1

    iput v1, p0, Landroid/widget/GridView;->mItemCount:I

    .line 204
    iput-boolean v5, p0, Landroid/widget/GridView;->mDataChanged:Z

    .line 205
    invoke-virtual {p0}, Landroid/widget/GridView;->checkFocus()V

    .line 207
    new-instance v1, Landroid/widget/AbsListView$AdapterDataSetObserver;

    invoke-direct {v1, p0}, Landroid/widget/AbsListView$AdapterDataSetObserver;-><init>(Landroid/widget/AbsListView;)V

    iput-object v1, p0, Landroid/widget/GridView;->mDataSetObserver:Landroid/widget/AbsListView$AdapterDataSetObserver;

    .line 208
    iget-object v1, p0, Landroid/widget/GridView;->mAdapter:Landroid/widget/ListAdapter;

    iget-object v2, p0, Landroid/widget/GridView;->mDataSetObserver:Landroid/widget/AbsListView$AdapterDataSetObserver;

    invoke-interface {v1, v2}, Landroid/widget/ListAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 210
    iget-object v1, p0, Landroid/widget/GridView;->mRecycler:Landroid/widget/AbsListView$RecycleBin;

    iget-object v2, p0, Landroid/widget/GridView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v2}, Landroid/widget/ListAdapter;->getViewTypeCount()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/AbsListView$RecycleBin;->setViewTypeCount(I)V

    .line 213
    iget-boolean v1, p0, Landroid/widget/GridView;->mStackFromBottom:Z

    if-eqz v1, :cond_1

    .line 214
    iget v1, p0, Landroid/widget/GridView;->mItemCount:I

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p0, v1, v4}, Landroid/widget/GridView;->lookForSelectablePosition(IZ)I

    move-result v0

    .line 218
    .local v0, "position":I
    :goto_0
    invoke-virtual {p0, v0}, Landroid/widget/GridView;->setSelectedPositionInt(I)V

    .line 219
    invoke-virtual {p0, v0}, Landroid/widget/GridView;->setNextSelectedPositionInt(I)V

    .line 220
    invoke-virtual {p0}, Landroid/widget/GridView;->checkSelectionChanged()V

    .line 227
    .end local v0    # "position":I
    :goto_1
    invoke-virtual {p0}, Landroid/widget/GridView;->requestLayout()V

    .line 228
    return-void

    .line 216
    :cond_1
    invoke-virtual {p0, v4, v5}, Landroid/widget/GridView;->lookForSelectablePosition(IZ)I

    move-result v0

    .restart local v0    # "position":I
    goto :goto_0

    .line 222
    .end local v0    # "position":I
    :cond_2
    invoke-virtual {p0}, Landroid/widget/GridView;->checkFocus()V

    .line 224
    invoke-virtual {p0}, Landroid/widget/GridView;->checkSelectionChanged()V

    goto :goto_1
.end method

.method public setColumnWidth(I)V
    .locals 1
    .param p1, "columnWidth"    # I

    .prologue
    .line 2178
    iget v0, p0, Landroid/widget/GridView;->mRequestedColumnWidth:I

    if-eq p1, v0, :cond_0

    .line 2179
    iput p1, p0, Landroid/widget/GridView;->mRequestedColumnWidth:I

    .line 2180
    invoke-virtual {p0}, Landroid/widget/GridView;->requestLayoutIfNecessary()V

    .line 2182
    :cond_0
    return-void
.end method

.method public setGravity(I)V
    .locals 1
    .param p1, "gravity"    # I

    .prologue
    .line 2047
    iget v0, p0, Landroid/widget/GridView;->mGravity:I

    if-eq v0, p1, :cond_0

    .line 2048
    iput p1, p0, Landroid/widget/GridView;->mGravity:I

    .line 2049
    invoke-virtual {p0}, Landroid/widget/GridView;->requestLayoutIfNecessary()V

    .line 2051
    :cond_0
    return-void
.end method

.method public setHorizontalSpacing(I)V
    .locals 1
    .param p1, "horizontalSpacing"    # I

    .prologue
    .line 2074
    iget v0, p0, Landroid/widget/GridView;->mRequestedHorizontalSpacing:I

    if-eq p1, v0, :cond_0

    .line 2075
    iput p1, p0, Landroid/widget/GridView;->mRequestedHorizontalSpacing:I

    .line 2076
    invoke-virtual {p0}, Landroid/widget/GridView;->requestLayoutIfNecessary()V

    .line 2078
    :cond_0
    return-void
.end method

.method public setNumColumns(I)V
    .locals 1
    .param p1, "numColumns"    # I

    .prologue
    .line 2225
    iget v0, p0, Landroid/widget/GridView;->mRequestedNumColumns:I

    if-eq p1, v0, :cond_0

    .line 2226
    iput p1, p0, Landroid/widget/GridView;->mRequestedNumColumns:I

    .line 2227
    invoke-virtual {p0}, Landroid/widget/GridView;->requestLayoutIfNecessary()V

    .line 2229
    :cond_0
    return-void
.end method

.method public setRemoteViewsAdapter(Landroid/content/Intent;)V
    .locals 0
    .param p1, "intent"    # Landroid/content/Intent;
    .annotation runtime Landroid/view/RemotableViewMethod;
    .end annotation

    .prologue
    .line 177
    invoke-super {p0, p1}, Landroid/widget/AbsListView;->setRemoteViewsAdapter(Landroid/content/Intent;)V

    .line 178
    return-void
.end method

.method public setSelection(I)V
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 1572
    invoke-virtual {p0}, Landroid/widget/GridView;->isInTouchMode()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1573
    invoke-virtual {p0, p1}, Landroid/widget/GridView;->setNextSelectedPositionInt(I)V

    .line 1577
    :goto_0
    const/4 v0, 0x2

    iput v0, p0, Landroid/widget/GridView;->mLayoutMode:I

    .line 1578
    iget-object v0, p0, Landroid/widget/GridView;->mPositionScroller:Landroid/widget/AbsListView$AbsPositionScroller;

    if-eqz v0, :cond_0

    .line 1579
    iget-object v0, p0, Landroid/widget/GridView;->mPositionScroller:Landroid/widget/AbsListView$AbsPositionScroller;

    invoke-virtual {v0}, Landroid/widget/AbsListView$AbsPositionScroller;->stop()V

    .line 1581
    :cond_0
    invoke-virtual {p0}, Landroid/widget/GridView;->requestLayout()V

    .line 1582
    return-void

    .line 1575
    :cond_1
    iput p1, p0, Landroid/widget/GridView;->mResurrectToPosition:I

    goto :goto_0
.end method

.method setSelectionInt(I)V
    .locals 7
    .param p1, "position"    # I

    .prologue
    .line 1591
    iget v4, p0, Landroid/widget/GridView;->mNextSelectedPosition:I

    .line 1593
    .local v4, "previousSelectedPosition":I
    iget-object v5, p0, Landroid/widget/GridView;->mPositionScroller:Landroid/widget/AbsListView$AbsPositionScroller;

    if-eqz v5, :cond_0

    .line 1594
    iget-object v5, p0, Landroid/widget/GridView;->mPositionScroller:Landroid/widget/AbsListView$AbsPositionScroller;

    invoke-virtual {v5}, Landroid/widget/AbsListView$AbsPositionScroller;->stop()V

    .line 1597
    :cond_0
    invoke-virtual {p0, p1}, Landroid/widget/GridView;->setNextSelectedPositionInt(I)V

    .line 1598
    invoke-virtual {p0}, Landroid/widget/GridView;->layoutChildren()V

    .line 1600
    iget-boolean v5, p0, Landroid/widget/GridView;->mStackFromBottom:Z

    if-eqz v5, :cond_2

    iget v5, p0, Landroid/widget/GridView;->mItemCount:I

    add-int/lit8 v5, v5, -0x1

    iget v6, p0, Landroid/widget/GridView;->mNextSelectedPosition:I

    sub-int v0, v5, v6

    .line 1602
    .local v0, "next":I
    :goto_0
    iget-boolean v5, p0, Landroid/widget/GridView;->mStackFromBottom:Z

    if-eqz v5, :cond_3

    iget v5, p0, Landroid/widget/GridView;->mItemCount:I

    add-int/lit8 v5, v5, -0x1

    sub-int v2, v5, v4

    .line 1605
    .local v2, "previous":I
    :goto_1
    iget v5, p0, Landroid/widget/GridView;->mNumColumns:I

    div-int v1, v0, v5

    .line 1606
    .local v1, "nextRow":I
    iget v5, p0, Landroid/widget/GridView;->mNumColumns:I

    div-int v3, v2, v5

    .line 1608
    .local v3, "previousRow":I
    if-eq v1, v3, :cond_1

    .line 1609
    invoke-virtual {p0}, Landroid/widget/GridView;->awakenScrollBars()Z

    .line 1612
    :cond_1
    return-void

    .line 1600
    .end local v0    # "next":I
    .end local v1    # "nextRow":I
    .end local v2    # "previous":I
    .end local v3    # "previousRow":I
    :cond_2
    iget v0, p0, Landroid/widget/GridView;->mNextSelectedPosition:I

    goto :goto_0

    .restart local v0    # "next":I
    :cond_3
    move v2, v4

    .line 1602
    goto :goto_1
.end method

.method public setStretchMode(I)V
    .locals 1
    .param p1, "stretchMode"    # I

    .prologue
    .line 2159
    iget v0, p0, Landroid/widget/GridView;->mStretchMode:I

    if-eq p1, v0, :cond_0

    .line 2160
    iput p1, p0, Landroid/widget/GridView;->mStretchMode:I

    .line 2161
    invoke-virtual {p0}, Landroid/widget/GridView;->requestLayoutIfNecessary()V

    .line 2163
    :cond_0
    return-void
.end method

.method public setVerticalSpacing(I)V
    .locals 1
    .param p1, "verticalSpacing"    # I

    .prologue
    .line 2131
    iget v0, p0, Landroid/widget/GridView;->mVerticalSpacing:I

    if-eq p1, v0, :cond_0

    .line 2132
    iput p1, p0, Landroid/widget/GridView;->mVerticalSpacing:I

    .line 2133
    invoke-virtual {p0}, Landroid/widget/GridView;->requestLayoutIfNecessary()V

    .line 2135
    :cond_0
    return-void
.end method

.method public smoothScrollByOffset(I)V
    .locals 0
    .param p1, "offset"    # I
    .annotation runtime Landroid/view/RemotableViewMethod;
    .end annotation

    .prologue
    .line 860
    invoke-super {p0, p1}, Landroid/widget/AbsListView;->smoothScrollByOffset(I)V

    .line 861
    return-void
.end method

.method public smoothScrollToPosition(I)V
    .locals 0
    .param p1, "position"    # I
    .annotation runtime Landroid/view/RemotableViewMethod;
    .end annotation

    .prologue
    .line 850
    invoke-super {p0, p1}, Landroid/widget/AbsListView;->smoothScrollToPosition(I)V

    .line 851
    return-void
.end method
