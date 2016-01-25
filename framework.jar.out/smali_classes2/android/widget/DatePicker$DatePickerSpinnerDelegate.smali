.class Landroid/widget/DatePicker$DatePickerSpinnerDelegate;
.super Landroid/widget/DatePicker$AbstractDatePickerDelegate;
.source "DatePicker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/widget/DatePicker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DatePickerSpinnerDelegate"
.end annotation


# static fields
.field private static final DATE_FORMAT:Ljava/lang/String; = "MM/dd/yyyy"

.field private static final DEFAULT_CALENDAR_VIEW_SHOWN:Z = true

.field private static final DEFAULT_ENABLED_STATE:Z = true

.field private static final DEFAULT_END_YEAR:I = 0x834

.field private static final DEFAULT_SPINNERS_SHOWN:Z = true

.field private static final DEFAULT_START_YEAR:I = 0x76c


# instance fields
.field private final mCalendarView:Landroid/widget/CalendarView;

.field private mCurrentDate:Ljava/util/Calendar;

.field private final mDateFormat:Ljava/text/DateFormat;

.field private final mDaySpinner:Landroid/widget/NumberPicker;

.field private final mDaySpinnerInput:Landroid/widget/EditText;

.field private mIsEnabled:Z

.field private mMaxDate:Ljava/util/Calendar;

.field private mMinDate:Ljava/util/Calendar;

.field private final mMonthSpinner:Landroid/widget/NumberPicker;

.field private final mMonthSpinnerInput:Landroid/widget/EditText;

.field private mNumberOfMonths:I

.field private mShortMonths:[Ljava/lang/String;

.field private final mSpinners:Landroid/widget/LinearLayout;

.field private mTempDate:Ljava/util/Calendar;

.field private final mYearSpinner:Landroid/widget/NumberPicker;

.field private final mYearSpinnerInput:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Landroid/widget/DatePicker;Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 18
    .param p1, "delegator"    # Landroid/widget/DatePicker;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "attrs"    # Landroid/util/AttributeSet;
    .param p4, "defStyleAttr"    # I
    .param p5, "defStyleRes"    # I

    .prologue
    .line 584
    invoke-direct/range {p0 .. p2}, Landroid/widget/DatePicker$AbstractDatePickerDelegate;-><init>(Landroid/widget/DatePicker;Landroid/content/Context;)V

    .line 568
    new-instance v14, Ljava/text/SimpleDateFormat;

    const-string v15, "MM/dd/yyyy"

    invoke-direct {v14, v15}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iput-object v14, v0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mDateFormat:Ljava/text/DateFormat;

    .line 580
    const/4 v14, 0x1

    move-object/from16 v0, p0

    iput-boolean v14, v0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mIsEnabled:Z

    .line 586
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mDelegator:Landroid/widget/DatePicker;

    .line 587
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    iput-object v0, v1, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mContext:Landroid/content/Context;

    .line 590
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v14

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->setCurrentLocale(Ljava/util/Locale;)V

    .line 592
    sget-object v14, Lcom/android/internal/R$styleable;->DatePicker:[I

    move-object/from16 v0, p2

    move-object/from16 v1, p3

    move/from16 v2, p4

    move/from16 v3, p5

    invoke-virtual {v0, v1, v14, v2, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v4

    .line 594
    .local v4, "attributesArray":Landroid/content/res/TypedArray;
    const/4 v14, 0x6

    const/4 v15, 0x1

    invoke-virtual {v4, v14, v15}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v12

    .line 596
    .local v12, "spinnersShown":Z
    const/4 v14, 0x7

    const/4 v15, 0x1

    invoke-virtual {v4, v14, v15}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v5

    .line 598
    .local v5, "calendarViewShown":Z
    const/4 v14, 0x1

    const/16 v15, 0x76c

    invoke-virtual {v4, v14, v15}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v13

    .line 600
    .local v13, "startYear":I
    const/4 v14, 0x2

    const/16 v15, 0x834

    invoke-virtual {v4, v14, v15}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v6

    .line 601
    .local v6, "endYear":I
    const/4 v14, 0x4

    invoke-virtual {v4, v14}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 602
    .local v10, "minDate":Ljava/lang/String;
    const/4 v14, 0x5

    invoke-virtual {v4, v14}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 603
    .local v9, "maxDate":Ljava/lang/String;
    const/16 v14, 0x13

    const v15, 0x1090042

    invoke-virtual {v4, v14, v15}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v8

    .line 605
    .local v8, "layoutResourceId":I
    invoke-virtual {v4}, Landroid/content/res/TypedArray;->recycle()V

    .line 607
    const-string v14, "layout_inflater"

    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/view/LayoutInflater;

    .line 609
    .local v7, "inflater":Landroid/view/LayoutInflater;
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mDelegator:Landroid/widget/DatePicker;

    const/4 v15, 0x1

    invoke-virtual {v7, v8, v14, v15}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 611
    new-instance v11, Landroid/widget/DatePicker$DatePickerSpinnerDelegate$1;

    move-object/from16 v0, p0

    invoke-direct {v11, v0}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate$1;-><init>(Landroid/widget/DatePicker$DatePickerSpinnerDelegate;)V

    .line 647
    .local v11, "onChangeListener":Landroid/widget/NumberPicker$OnValueChangeListener;
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mDelegator:Landroid/widget/DatePicker;

    const v15, 0x10202e7

    invoke-virtual {v14, v15}, Landroid/widget/DatePicker;->findViewById(I)Landroid/view/View;

    move-result-object v14

    check-cast v14, Landroid/widget/LinearLayout;

    move-object/from16 v0, p0

    iput-object v14, v0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mSpinners:Landroid/widget/LinearLayout;

    .line 650
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mDelegator:Landroid/widget/DatePicker;

    const v15, 0x10202eb

    invoke-virtual {v14, v15}, Landroid/widget/DatePicker;->findViewById(I)Landroid/view/View;

    move-result-object v14

    check-cast v14, Landroid/widget/CalendarView;

    move-object/from16 v0, p0

    iput-object v14, v0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCalendarView:Landroid/widget/CalendarView;

    .line 651
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCalendarView:Landroid/widget/CalendarView;

    new-instance v15, Landroid/widget/DatePicker$DatePickerSpinnerDelegate$2;

    move-object/from16 v0, p0

    invoke-direct {v15, v0}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate$2;-><init>(Landroid/widget/DatePicker$DatePickerSpinnerDelegate;)V

    invoke-virtual {v14, v15}, Landroid/widget/CalendarView;->setOnDateChangeListener(Landroid/widget/CalendarView$OnDateChangeListener;)V

    .line 660
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mDelegator:Landroid/widget/DatePicker;

    const v15, 0x10202e9

    invoke-virtual {v14, v15}, Landroid/widget/DatePicker;->findViewById(I)Landroid/view/View;

    move-result-object v14

    check-cast v14, Landroid/widget/NumberPicker;

    move-object/from16 v0, p0

    iput-object v14, v0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mDaySpinner:Landroid/widget/NumberPicker;

    .line 661
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mDaySpinner:Landroid/widget/NumberPicker;

    invoke-static {}, Landroid/widget/NumberPicker;->getTwoDigitFormatter()Landroid/widget/NumberPicker$Formatter;

    move-result-object v15

    invoke-virtual {v14, v15}, Landroid/widget/NumberPicker;->setFormatter(Landroid/widget/NumberPicker$Formatter;)V

    .line 662
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mDaySpinner:Landroid/widget/NumberPicker;

    const-wide/16 v16, 0x64

    move-wide/from16 v0, v16

    invoke-virtual {v14, v0, v1}, Landroid/widget/NumberPicker;->setOnLongPressUpdateInterval(J)V

    .line 663
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mDaySpinner:Landroid/widget/NumberPicker;

    invoke-virtual {v14, v11}, Landroid/widget/NumberPicker;->setOnValueChangedListener(Landroid/widget/NumberPicker$OnValueChangeListener;)V

    .line 664
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mDaySpinner:Landroid/widget/NumberPicker;

    const v15, 0x102034d

    invoke-virtual {v14, v15}, Landroid/widget/NumberPicker;->findViewById(I)Landroid/view/View;

    move-result-object v14

    check-cast v14, Landroid/widget/EditText;

    move-object/from16 v0, p0

    iput-object v14, v0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mDaySpinnerInput:Landroid/widget/EditText;

    .line 667
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mDelegator:Landroid/widget/DatePicker;

    const v15, 0x10202e8

    invoke-virtual {v14, v15}, Landroid/widget/DatePicker;->findViewById(I)Landroid/view/View;

    move-result-object v14

    check-cast v14, Landroid/widget/NumberPicker;

    move-object/from16 v0, p0

    iput-object v14, v0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMonthSpinner:Landroid/widget/NumberPicker;

    .line 668
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMonthSpinner:Landroid/widget/NumberPicker;

    const/4 v15, 0x0

    invoke-virtual {v14, v15}, Landroid/widget/NumberPicker;->setMinValue(I)V

    .line 669
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMonthSpinner:Landroid/widget/NumberPicker;

    move-object/from16 v0, p0

    iget v15, v0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mNumberOfMonths:I

    add-int/lit8 v15, v15, -0x1

    invoke-virtual {v14, v15}, Landroid/widget/NumberPicker;->setMaxValue(I)V

    .line 670
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMonthSpinner:Landroid/widget/NumberPicker;

    move-object/from16 v0, p0

    iget-object v15, v0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mShortMonths:[Ljava/lang/String;

    invoke-virtual {v14, v15}, Landroid/widget/NumberPicker;->setDisplayedValues([Ljava/lang/String;)V

    .line 671
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMonthSpinner:Landroid/widget/NumberPicker;

    const-wide/16 v16, 0xc8

    move-wide/from16 v0, v16

    invoke-virtual {v14, v0, v1}, Landroid/widget/NumberPicker;->setOnLongPressUpdateInterval(J)V

    .line 672
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMonthSpinner:Landroid/widget/NumberPicker;

    invoke-virtual {v14, v11}, Landroid/widget/NumberPicker;->setOnValueChangedListener(Landroid/widget/NumberPicker$OnValueChangeListener;)V

    .line 673
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMonthSpinner:Landroid/widget/NumberPicker;

    const v15, 0x102034d

    invoke-virtual {v14, v15}, Landroid/widget/NumberPicker;->findViewById(I)Landroid/view/View;

    move-result-object v14

    check-cast v14, Landroid/widget/EditText;

    move-object/from16 v0, p0

    iput-object v14, v0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMonthSpinnerInput:Landroid/widget/EditText;

    .line 676
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mDelegator:Landroid/widget/DatePicker;

    const v15, 0x10202ea

    invoke-virtual {v14, v15}, Landroid/widget/DatePicker;->findViewById(I)Landroid/view/View;

    move-result-object v14

    check-cast v14, Landroid/widget/NumberPicker;

    move-object/from16 v0, p0

    iput-object v14, v0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mYearSpinner:Landroid/widget/NumberPicker;

    .line 677
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mYearSpinner:Landroid/widget/NumberPicker;

    const-wide/16 v16, 0x64

    move-wide/from16 v0, v16

    invoke-virtual {v14, v0, v1}, Landroid/widget/NumberPicker;->setOnLongPressUpdateInterval(J)V

    .line 678
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mYearSpinner:Landroid/widget/NumberPicker;

    invoke-virtual {v14, v11}, Landroid/widget/NumberPicker;->setOnValueChangedListener(Landroid/widget/NumberPicker$OnValueChangeListener;)V

    .line 679
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mYearSpinner:Landroid/widget/NumberPicker;

    const v15, 0x102034d

    invoke-virtual {v14, v15}, Landroid/widget/NumberPicker;->findViewById(I)Landroid/view/View;

    move-result-object v14

    check-cast v14, Landroid/widget/EditText;

    move-object/from16 v0, p0

    iput-object v14, v0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mYearSpinnerInput:Landroid/widget/EditText;

    .line 683
    if-nez v12, :cond_3

    if-nez v5, :cond_3

    .line 684
    const/4 v14, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->setSpinnersShown(Z)V

    .line 691
    :goto_0
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mTempDate:Ljava/util/Calendar;

    invoke-virtual {v14}, Ljava/util/Calendar;->clear()V

    .line 692
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v14

    if-nez v14, :cond_4

    .line 693
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mTempDate:Ljava/util/Calendar;

    move-object/from16 v0, p0

    invoke-direct {v0, v10, v14}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->parseDate(Ljava/lang/String;Ljava/util/Calendar;)Z

    move-result v14

    if-nez v14, :cond_0

    .line 694
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mTempDate:Ljava/util/Calendar;

    const/4 v15, 0x0

    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v14, v13, v15, v0}, Ljava/util/Calendar;->set(III)V

    .line 699
    :cond_0
    :goto_1
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mTempDate:Ljava/util/Calendar;

    invoke-virtual {v14}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v14

    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v15}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->setMinDate(J)V

    .line 702
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mTempDate:Ljava/util/Calendar;

    invoke-virtual {v14}, Ljava/util/Calendar;->clear()V

    .line 703
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v14

    if-nez v14, :cond_5

    .line 704
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mTempDate:Ljava/util/Calendar;

    move-object/from16 v0, p0

    invoke-direct {v0, v9, v14}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->parseDate(Ljava/lang/String;Ljava/util/Calendar;)Z

    move-result v14

    if-nez v14, :cond_1

    .line 705
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mTempDate:Ljava/util/Calendar;

    const/16 v15, 0xb

    const/16 v16, 0x1f

    move/from16 v0, v16

    invoke-virtual {v14, v6, v15, v0}, Ljava/util/Calendar;->set(III)V

    .line 710
    :cond_1
    :goto_2
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mTempDate:Ljava/util/Calendar;

    invoke-virtual {v14}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v14

    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v15}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->setMaxDate(J)V

    .line 713
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCurrentDate:Ljava/util/Calendar;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v16

    move-wide/from16 v0, v16

    invoke-virtual {v14, v0, v1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 714
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCurrentDate:Ljava/util/Calendar;

    const/4 v15, 0x1

    invoke-virtual {v14, v15}, Ljava/util/Calendar;->get(I)I

    move-result v14

    move-object/from16 v0, p0

    iget-object v15, v0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCurrentDate:Ljava/util/Calendar;

    const/16 v16, 0x2

    invoke-virtual/range {v15 .. v16}, Ljava/util/Calendar;->get(I)I

    move-result v15

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCurrentDate:Ljava/util/Calendar;

    move-object/from16 v16, v0

    const/16 v17, 0x5

    invoke-virtual/range {v16 .. v17}, Ljava/util/Calendar;->get(I)I

    move-result v16

    const/16 v17, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v16

    move-object/from16 v2, v17

    invoke-virtual {v0, v14, v15, v1, v2}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->init(IIILandroid/widget/DatePicker$OnDateChangedListener;)V

    .line 718
    invoke-direct/range {p0 .. p0}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->reorderSpinners()V

    .line 721
    invoke-direct/range {p0 .. p0}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->setContentDescriptions()V

    .line 724
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mDelegator:Landroid/widget/DatePicker;

    invoke-virtual {v14}, Landroid/widget/DatePicker;->getImportantForAccessibility()I

    move-result v14

    if-nez v14, :cond_2

    .line 725
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mDelegator:Landroid/widget/DatePicker;

    const/4 v15, 0x1

    invoke-virtual {v14, v15}, Landroid/widget/DatePicker;->setImportantForAccessibility(I)V

    .line 727
    :cond_2
    return-void

    .line 686
    :cond_3
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->setSpinnersShown(Z)V

    .line 687
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->setCalendarViewShown(Z)V

    goto/16 :goto_0

    .line 697
    :cond_4
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mTempDate:Ljava/util/Calendar;

    const/4 v15, 0x0

    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v14, v13, v15, v0}, Ljava/util/Calendar;->set(III)V

    goto/16 :goto_1

    .line 708
    :cond_5
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mTempDate:Ljava/util/Calendar;

    const/16 v15, 0xb

    const/16 v16, 0x1f

    move/from16 v0, v16

    invoke-virtual {v14, v6, v15, v0}, Ljava/util/Calendar;->set(III)V

    goto/16 :goto_2
.end method

.method static synthetic access$000(Landroid/widget/DatePicker$DatePickerSpinnerDelegate;)V
    .locals 0
    .param p0, "x0"    # Landroid/widget/DatePicker$DatePickerSpinnerDelegate;

    .prologue
    .line 536
    invoke-direct {p0}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->updateInputState()V

    return-void
.end method

.method static synthetic access$100(Landroid/widget/DatePicker$DatePickerSpinnerDelegate;)Ljava/util/Calendar;
    .locals 1
    .param p0, "x0"    # Landroid/widget/DatePicker$DatePickerSpinnerDelegate;

    .prologue
    .line 536
    iget-object v0, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCurrentDate:Ljava/util/Calendar;

    return-object v0
.end method

.method static synthetic access$200(Landroid/widget/DatePicker$DatePickerSpinnerDelegate;)Ljava/util/Calendar;
    .locals 1
    .param p0, "x0"    # Landroid/widget/DatePicker$DatePickerSpinnerDelegate;

    .prologue
    .line 536
    iget-object v0, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mTempDate:Ljava/util/Calendar;

    return-object v0
.end method

.method static synthetic access$300(Landroid/widget/DatePicker$DatePickerSpinnerDelegate;)Landroid/widget/NumberPicker;
    .locals 1
    .param p0, "x0"    # Landroid/widget/DatePicker$DatePickerSpinnerDelegate;

    .prologue
    .line 536
    iget-object v0, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mDaySpinner:Landroid/widget/NumberPicker;

    return-object v0
.end method

.method static synthetic access$400(Landroid/widget/DatePicker$DatePickerSpinnerDelegate;)Landroid/widget/NumberPicker;
    .locals 1
    .param p0, "x0"    # Landroid/widget/DatePicker$DatePickerSpinnerDelegate;

    .prologue
    .line 536
    iget-object v0, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMonthSpinner:Landroid/widget/NumberPicker;

    return-object v0
.end method

.method static synthetic access$500(Landroid/widget/DatePicker$DatePickerSpinnerDelegate;)Landroid/widget/NumberPicker;
    .locals 1
    .param p0, "x0"    # Landroid/widget/DatePicker$DatePickerSpinnerDelegate;

    .prologue
    .line 536
    iget-object v0, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mYearSpinner:Landroid/widget/NumberPicker;

    return-object v0
.end method

.method static synthetic access$600(Landroid/widget/DatePicker$DatePickerSpinnerDelegate;III)V
    .locals 0
    .param p0, "x0"    # Landroid/widget/DatePicker$DatePickerSpinnerDelegate;
    .param p1, "x1"    # I
    .param p2, "x2"    # I
    .param p3, "x3"    # I

    .prologue
    .line 536
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->setDate(III)V

    return-void
.end method

.method static synthetic access$700(Landroid/widget/DatePicker$DatePickerSpinnerDelegate;)V
    .locals 0
    .param p0, "x0"    # Landroid/widget/DatePicker$DatePickerSpinnerDelegate;

    .prologue
    .line 536
    invoke-direct {p0}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->updateSpinners()V

    return-void
.end method

.method static synthetic access$800(Landroid/widget/DatePicker$DatePickerSpinnerDelegate;)V
    .locals 0
    .param p0, "x0"    # Landroid/widget/DatePicker$DatePickerSpinnerDelegate;

    .prologue
    .line 536
    invoke-direct {p0}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->updateCalendarView()V

    return-void
.end method

.method static synthetic access$900(Landroid/widget/DatePicker$DatePickerSpinnerDelegate;)V
    .locals 0
    .param p0, "x0"    # Landroid/widget/DatePicker$DatePickerSpinnerDelegate;

    .prologue
    .line 536
    invoke-direct {p0}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->notifyDateChanged()V

    return-void
.end method

.method private getCalendarForLocale(Ljava/util/Calendar;Ljava/util/Locale;)Ljava/util/Calendar;
    .locals 3
    .param p1, "oldCalendar"    # Ljava/util/Calendar;
    .param p2, "locale"    # Ljava/util/Locale;

    .prologue
    .line 943
    if-nez p1, :cond_0

    .line 944
    invoke-static {p2}, Ljava/util/Calendar;->getInstance(Ljava/util/Locale;)Ljava/util/Calendar;

    move-result-object v2

    .line 949
    :goto_0
    return-object v2

    .line 946
    :cond_0
    invoke-virtual {p1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v0

    .line 947
    .local v0, "currentTimeMillis":J
    invoke-static {p2}, Ljava/util/Calendar;->getInstance(Ljava/util/Locale;)Ljava/util/Calendar;

    move-result-object v2

    .line 948
    .local v2, "newCalendar":Ljava/util/Calendar;
    invoke-virtual {v2, v0, v1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    goto :goto_0
.end method

.method private isNewDate(III)Z
    .locals 3
    .param p1, "year"    # I
    .param p2, "month"    # I
    .param p3, "dayOfMonth"    # I

    .prologue
    const/4 v0, 0x1

    .line 1002
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCurrentDate:Ljava/util/Calendar;

    invoke-virtual {v1, v0}, Ljava/util/Calendar;->get(I)I

    move-result v1

    if-ne v1, p1, :cond_0

    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCurrentDate:Ljava/util/Calendar;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Ljava/util/Calendar;->get(I)I

    move-result v1

    if-ne v1, p3, :cond_0

    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCurrentDate:Ljava/util/Calendar;

    const/4 v2, 0x5

    invoke-virtual {v1, v2}, Ljava/util/Calendar;->get(I)I

    move-result v1

    if-eq v1, p2, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private notifyDateChanged()V
    .locals 5

    .prologue
    .line 1077
    iget-object v0, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mDelegator:Landroid/widget/DatePicker;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/DatePicker;->sendAccessibilityEvent(I)V

    .line 1078
    iget-object v0, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mOnDateChangedListener:Landroid/widget/DatePicker$OnDateChangedListener;

    if-eqz v0, :cond_0

    .line 1079
    iget-object v0, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mOnDateChangedListener:Landroid/widget/DatePicker$OnDateChangedListener;

    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mDelegator:Landroid/widget/DatePicker;

    invoke-virtual {p0}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->getYear()I

    move-result v2

    invoke-virtual {p0}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->getMonth()I

    move-result v3

    invoke-virtual {p0}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->getDayOfMonth()I

    move-result v4

    invoke-interface {v0, v1, v2, v3, v4}, Landroid/widget/DatePicker$OnDateChangedListener;->onDateChanged(Landroid/widget/DatePicker;III)V

    .line 1082
    :cond_0
    return-void
.end method

.method private parseDate(Ljava/lang/String;Ljava/util/Calendar;)Z
    .locals 4
    .param p1, "date"    # Ljava/lang/String;
    .param p2, "outDate"    # Ljava/util/Calendar;

    .prologue
    .line 993
    :try_start_0
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mDateFormat:Ljava/text/DateFormat;

    invoke-virtual {v1, p1}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 994
    const/4 v1, 0x1

    .line 997
    :goto_0
    return v1

    .line 995
    :catch_0
    move-exception v0

    .line 996
    .local v0, "e":Ljava/text/ParseException;
    # getter for: Landroid/widget/DatePicker;->LOG_TAG:Ljava/lang/String;
    invoke-static {}, Landroid/widget/DatePicker;->access$1400()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Date: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " not in format: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "MM/dd/yyyy"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 997
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private reorderSpinners()V
    .locals 6

    .prologue
    .line 959
    iget-object v4, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mSpinners:Landroid/widget/LinearLayout;

    invoke-virtual {v4}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 962
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v4

    const-string v5, "yyyyMMMdd"

    invoke-static {v4, v5}, Landroid/text/format/DateFormat;->getBestDateTimePattern(Ljava/util/Locale;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 963
    .local v2, "pattern":Ljava/lang/String;
    invoke-static {v2}, Llibcore/icu/ICU;->getDateFormatOrder(Ljava/lang/String;)[C

    move-result-object v1

    .line 964
    .local v1, "order":[C
    array-length v3, v1

    .line 965
    .local v3, "spinnerCount":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v3, :cond_0

    .line 966
    aget-char v4, v1, v0

    sparse-switch v4, :sswitch_data_0

    .line 980
    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-static {v1}, Ljava/util/Arrays;->toString([C)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 968
    :sswitch_0
    iget-object v4, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mSpinners:Landroid/widget/LinearLayout;

    iget-object v5, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mDaySpinner:Landroid/widget/NumberPicker;

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 969
    iget-object v4, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mDaySpinner:Landroid/widget/NumberPicker;

    invoke-direct {p0, v4, v3, v0}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->setImeOptions(Landroid/widget/NumberPicker;II)V

    .line 965
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 972
    :sswitch_1
    iget-object v4, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mSpinners:Landroid/widget/LinearLayout;

    iget-object v5, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMonthSpinner:Landroid/widget/NumberPicker;

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 973
    iget-object v4, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMonthSpinner:Landroid/widget/NumberPicker;

    invoke-direct {p0, v4, v3, v0}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->setImeOptions(Landroid/widget/NumberPicker;II)V

    goto :goto_1

    .line 976
    :sswitch_2
    iget-object v4, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mSpinners:Landroid/widget/LinearLayout;

    iget-object v5, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mYearSpinner:Landroid/widget/NumberPicker;

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 977
    iget-object v4, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mYearSpinner:Landroid/widget/NumberPicker;

    invoke-direct {p0, v4, v3, v0}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->setImeOptions(Landroid/widget/NumberPicker;II)V

    goto :goto_1

    .line 983
    :cond_0
    return-void

    .line 966
    :sswitch_data_0
    .sparse-switch
        0x4d -> :sswitch_1
        0x64 -> :sswitch_0
        0x79 -> :sswitch_2
    .end sparse-switch
.end method

.method private setContentDescriptions()V
    .locals 4

    .prologue
    const v3, 0x102034e

    const v2, 0x102034c

    .line 1104
    iget-object v0, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mDaySpinner:Landroid/widget/NumberPicker;

    const v1, 0x1040679

    invoke-direct {p0, v0, v2, v1}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->trySetContentDescription(Landroid/view/View;II)V

    .line 1106
    iget-object v0, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mDaySpinner:Landroid/widget/NumberPicker;

    const v1, 0x104067a

    invoke-direct {p0, v0, v3, v1}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->trySetContentDescription(Landroid/view/View;II)V

    .line 1109
    iget-object v0, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMonthSpinner:Landroid/widget/NumberPicker;

    const v1, 0x1040677

    invoke-direct {p0, v0, v2, v1}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->trySetContentDescription(Landroid/view/View;II)V

    .line 1111
    iget-object v0, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMonthSpinner:Landroid/widget/NumberPicker;

    const v1, 0x1040678

    invoke-direct {p0, v0, v3, v1}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->trySetContentDescription(Landroid/view/View;II)V

    .line 1114
    iget-object v0, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mYearSpinner:Landroid/widget/NumberPicker;

    const v1, 0x104067b

    invoke-direct {p0, v0, v2, v1}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->trySetContentDescription(Landroid/view/View;II)V

    .line 1116
    iget-object v0, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mYearSpinner:Landroid/widget/NumberPicker;

    const v1, 0x104067c

    invoke-direct {p0, v0, v3, v1}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->trySetContentDescription(Landroid/view/View;II)V

    .line 1118
    return-void
.end method

.method private setDate(III)V
    .locals 4
    .param p1, "year"    # I
    .param p2, "month"    # I
    .param p3, "dayOfMonth"    # I

    .prologue
    .line 1008
    iget-object v0, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCurrentDate:Ljava/util/Calendar;

    invoke-virtual {v0, p1, p2, p3}, Ljava/util/Calendar;->set(III)V

    .line 1009
    iget-object v0, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCurrentDate:Ljava/util/Calendar;

    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMinDate:Ljava/util/Calendar;

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->before(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1010
    iget-object v0, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCurrentDate:Ljava/util/Calendar;

    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMinDate:Ljava/util/Calendar;

    invoke-virtual {v1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 1014
    :cond_0
    :goto_0
    return-void

    .line 1011
    :cond_1
    iget-object v0, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCurrentDate:Ljava/util/Calendar;

    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMaxDate:Ljava/util/Calendar;

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->after(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1012
    iget-object v0, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCurrentDate:Ljava/util/Calendar;

    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMaxDate:Ljava/util/Calendar;

    invoke-virtual {v1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/util/Calendar;->setTimeInMillis(J)V

    goto :goto_0
.end method

.method private setImeOptions(Landroid/widget/NumberPicker;II)V
    .locals 3
    .param p1, "spinner"    # Landroid/widget/NumberPicker;
    .param p2, "spinnerCount"    # I
    .param p3, "spinnerIndex"    # I

    .prologue
    .line 1093
    add-int/lit8 v2, p2, -0x1

    if-ge p3, v2, :cond_0

    .line 1094
    const/4 v0, 0x5

    .line 1098
    .local v0, "imeOptions":I
    :goto_0
    const v2, 0x102034d

    invoke-virtual {p1, v2}, Landroid/widget/NumberPicker;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 1099
    .local v1, "input":Landroid/widget/TextView;
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setImeOptions(I)V

    .line 1100
    return-void

    .line 1096
    .end local v0    # "imeOptions":I
    .end local v1    # "input":Landroid/widget/TextView;
    :cond_0
    const/4 v0, 0x6

    .restart local v0    # "imeOptions":I
    goto :goto_0
.end method

.method private trySetContentDescription(Landroid/view/View;II)V
    .locals 2
    .param p1, "root"    # Landroid/view/View;
    .param p2, "viewId"    # I
    .param p3, "contDescResId"    # I

    .prologue
    .line 1121
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 1122
    .local v0, "target":Landroid/view/View;
    if-eqz v0, :cond_0

    .line 1123
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mContext:Landroid/content/Context;

    invoke-virtual {v1, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 1125
    :cond_0
    return-void
.end method

.method private updateCalendarView()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 1069
    iget-object v0, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCalendarView:Landroid/widget/CalendarView;

    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCurrentDate:Ljava/util/Calendar;

    invoke-virtual {v1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3, v4, v4}, Landroid/widget/CalendarView;->setDate(JZZ)V

    .line 1070
    return-void
.end method

.method private updateInputState()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 1133
    invoke-static {}, Landroid/view/inputmethod/InputMethodManager;->peekInstance()Landroid/view/inputmethod/InputMethodManager;

    move-result-object v0

    .line 1134
    .local v0, "inputMethodManager":Landroid/view/inputmethod/InputMethodManager;
    if-eqz v0, :cond_0

    .line 1135
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mYearSpinnerInput:Landroid/widget/EditText;

    invoke-virtual {v0, v1}, Landroid/view/inputmethod/InputMethodManager;->isActive(Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1136
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mYearSpinnerInput:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->clearFocus()V

    .line 1137
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mDelegator:Landroid/widget/DatePicker;

    invoke-virtual {v1}, Landroid/widget/DatePicker;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 1146
    :cond_0
    :goto_0
    return-void

    .line 1138
    :cond_1
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMonthSpinnerInput:Landroid/widget/EditText;

    invoke-virtual {v0, v1}, Landroid/view/inputmethod/InputMethodManager;->isActive(Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1139
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMonthSpinnerInput:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->clearFocus()V

    .line 1140
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mDelegator:Landroid/widget/DatePicker;

    invoke-virtual {v1}, Landroid/widget/DatePicker;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    goto :goto_0

    .line 1141
    :cond_2
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mDaySpinnerInput:Landroid/widget/EditText;

    invoke-virtual {v0, v1}, Landroid/view/inputmethod/InputMethodManager;->isActive(Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1142
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mDaySpinnerInput:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->clearFocus()V

    .line 1143
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mDelegator:Landroid/widget/DatePicker;

    invoke-virtual {v1}, Landroid/widget/DatePicker;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    goto :goto_0
.end method

.method private updateSpinners()V
    .locals 8

    .prologue
    const/4 v3, 0x0

    const/4 v7, 0x5

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 1018
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCurrentDate:Ljava/util/Calendar;

    iget-object v2, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMinDate:Ljava/util/Calendar;

    invoke-virtual {v1, v2}, Ljava/util/Calendar;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1019
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mDaySpinner:Landroid/widget/NumberPicker;

    iget-object v2, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCurrentDate:Ljava/util/Calendar;

    invoke-virtual {v2, v7}, Ljava/util/Calendar;->get(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/NumberPicker;->setMinValue(I)V

    .line 1020
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mDaySpinner:Landroid/widget/NumberPicker;

    iget-object v2, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCurrentDate:Ljava/util/Calendar;

    invoke-virtual {v2, v7}, Ljava/util/Calendar;->getActualMaximum(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/NumberPicker;->setMaxValue(I)V

    .line 1021
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mDaySpinner:Landroid/widget/NumberPicker;

    invoke-virtual {v1, v4}, Landroid/widget/NumberPicker;->setWrapSelectorWheel(Z)V

    .line 1022
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMonthSpinner:Landroid/widget/NumberPicker;

    invoke-virtual {v1, v3}, Landroid/widget/NumberPicker;->setDisplayedValues([Ljava/lang/String;)V

    .line 1023
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMonthSpinner:Landroid/widget/NumberPicker;

    iget-object v2, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCurrentDate:Ljava/util/Calendar;

    invoke-virtual {v2, v6}, Ljava/util/Calendar;->get(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/NumberPicker;->setMinValue(I)V

    .line 1024
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMonthSpinner:Landroid/widget/NumberPicker;

    iget-object v2, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCurrentDate:Ljava/util/Calendar;

    invoke-virtual {v2, v6}, Ljava/util/Calendar;->getActualMaximum(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/NumberPicker;->setMaxValue(I)V

    .line 1025
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMonthSpinner:Landroid/widget/NumberPicker;

    invoke-virtual {v1, v4}, Landroid/widget/NumberPicker;->setWrapSelectorWheel(Z)V

    .line 1046
    :goto_0
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mShortMonths:[Ljava/lang/String;

    iget-object v2, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMonthSpinner:Landroid/widget/NumberPicker;

    invoke-virtual {v2}, Landroid/widget/NumberPicker;->getMinValue()I

    move-result v2

    iget-object v3, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMonthSpinner:Landroid/widget/NumberPicker;

    invoke-virtual {v3}, Landroid/widget/NumberPicker;->getMaxValue()I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-static {v1, v2, v3}, Ljava/util/Arrays;->copyOfRange([Ljava/lang/Object;II)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    .line 1048
    .local v0, "displayedValues":[Ljava/lang/String;
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMonthSpinner:Landroid/widget/NumberPicker;

    invoke-virtual {v1, v0}, Landroid/widget/NumberPicker;->setDisplayedValues([Ljava/lang/String;)V

    .line 1051
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mYearSpinner:Landroid/widget/NumberPicker;

    iget-object v2, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMinDate:Ljava/util/Calendar;

    invoke-virtual {v2, v5}, Ljava/util/Calendar;->get(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/NumberPicker;->setMinValue(I)V

    .line 1052
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mYearSpinner:Landroid/widget/NumberPicker;

    iget-object v2, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMaxDate:Ljava/util/Calendar;

    invoke-virtual {v2, v5}, Ljava/util/Calendar;->get(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/NumberPicker;->setMaxValue(I)V

    .line 1053
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mYearSpinner:Landroid/widget/NumberPicker;

    invoke-virtual {v1, v4}, Landroid/widget/NumberPicker;->setWrapSelectorWheel(Z)V

    .line 1056
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mYearSpinner:Landroid/widget/NumberPicker;

    iget-object v2, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCurrentDate:Ljava/util/Calendar;

    invoke-virtual {v2, v5}, Ljava/util/Calendar;->get(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/NumberPicker;->setValue(I)V

    .line 1057
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMonthSpinner:Landroid/widget/NumberPicker;

    iget-object v2, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCurrentDate:Ljava/util/Calendar;

    invoke-virtual {v2, v6}, Ljava/util/Calendar;->get(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/NumberPicker;->setValue(I)V

    .line 1058
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mDaySpinner:Landroid/widget/NumberPicker;

    iget-object v2, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCurrentDate:Ljava/util/Calendar;

    invoke-virtual {v2, v7}, Ljava/util/Calendar;->get(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/NumberPicker;->setValue(I)V

    .line 1060
    invoke-direct {p0}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->usingNumericMonths()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1061
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMonthSpinnerInput:Landroid/widget/EditText;

    invoke-virtual {v1, v6}, Landroid/widget/EditText;->setRawInputType(I)V

    .line 1063
    :cond_0
    return-void

    .line 1026
    .end local v0    # "displayedValues":[Ljava/lang/String;
    :cond_1
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCurrentDate:Ljava/util/Calendar;

    iget-object v2, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMaxDate:Ljava/util/Calendar;

    invoke-virtual {v1, v2}, Ljava/util/Calendar;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1027
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mDaySpinner:Landroid/widget/NumberPicker;

    iget-object v2, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCurrentDate:Ljava/util/Calendar;

    invoke-virtual {v2, v7}, Ljava/util/Calendar;->getActualMinimum(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/NumberPicker;->setMinValue(I)V

    .line 1028
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mDaySpinner:Landroid/widget/NumberPicker;

    iget-object v2, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCurrentDate:Ljava/util/Calendar;

    invoke-virtual {v2, v7}, Ljava/util/Calendar;->get(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/NumberPicker;->setMaxValue(I)V

    .line 1029
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mDaySpinner:Landroid/widget/NumberPicker;

    invoke-virtual {v1, v4}, Landroid/widget/NumberPicker;->setWrapSelectorWheel(Z)V

    .line 1030
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMonthSpinner:Landroid/widget/NumberPicker;

    invoke-virtual {v1, v3}, Landroid/widget/NumberPicker;->setDisplayedValues([Ljava/lang/String;)V

    .line 1031
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMonthSpinner:Landroid/widget/NumberPicker;

    iget-object v2, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCurrentDate:Ljava/util/Calendar;

    invoke-virtual {v2, v6}, Ljava/util/Calendar;->getActualMinimum(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/NumberPicker;->setMinValue(I)V

    .line 1032
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMonthSpinner:Landroid/widget/NumberPicker;

    iget-object v2, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCurrentDate:Ljava/util/Calendar;

    invoke-virtual {v2, v6}, Ljava/util/Calendar;->get(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/NumberPicker;->setMaxValue(I)V

    .line 1033
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMonthSpinner:Landroid/widget/NumberPicker;

    invoke-virtual {v1, v4}, Landroid/widget/NumberPicker;->setWrapSelectorWheel(Z)V

    goto/16 :goto_0

    .line 1035
    :cond_2
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mDaySpinner:Landroid/widget/NumberPicker;

    invoke-virtual {v1, v5}, Landroid/widget/NumberPicker;->setMinValue(I)V

    .line 1036
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mDaySpinner:Landroid/widget/NumberPicker;

    iget-object v2, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCurrentDate:Ljava/util/Calendar;

    invoke-virtual {v2, v7}, Ljava/util/Calendar;->getActualMaximum(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/NumberPicker;->setMaxValue(I)V

    .line 1037
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mDaySpinner:Landroid/widget/NumberPicker;

    invoke-virtual {v1, v5}, Landroid/widget/NumberPicker;->setWrapSelectorWheel(Z)V

    .line 1038
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMonthSpinner:Landroid/widget/NumberPicker;

    invoke-virtual {v1, v3}, Landroid/widget/NumberPicker;->setDisplayedValues([Ljava/lang/String;)V

    .line 1039
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMonthSpinner:Landroid/widget/NumberPicker;

    invoke-virtual {v1, v4}, Landroid/widget/NumberPicker;->setMinValue(I)V

    .line 1040
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMonthSpinner:Landroid/widget/NumberPicker;

    const/16 v2, 0xb

    invoke-virtual {v1, v2}, Landroid/widget/NumberPicker;->setMaxValue(I)V

    .line 1041
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMonthSpinner:Landroid/widget/NumberPicker;

    invoke-virtual {v1, v5}, Landroid/widget/NumberPicker;->setWrapSelectorWheel(Z)V

    goto/16 :goto_0
.end method

.method private usingNumericMonths()Z
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 933
    iget-object v0, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mShortMonths:[Ljava/lang/String;

    aget-object v0, v0, v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/Character;->isDigit(C)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/accessibility/AccessibilityEvent;

    .prologue
    .line 879
    invoke-virtual {p0, p1}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->onPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 880
    const/4 v0, 0x1

    return v0
.end method

.method public getCalendarView()Landroid/widget/CalendarView;
    .locals 1

    .prologue
    .line 836
    iget-object v0, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCalendarView:Landroid/widget/CalendarView;

    return-object v0
.end method

.method public getCalendarViewShown()Z
    .locals 1

    .prologue
    .line 846
    iget-object v0, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCalendarView:Landroid/widget/CalendarView;

    invoke-virtual {v0}, Landroid/widget/CalendarView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getDayOfMonth()I
    .locals 2

    .prologue
    .line 761
    iget-object v0, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCurrentDate:Ljava/util/Calendar;

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v0

    return v0
.end method

.method public getFirstDayOfWeek()I
    .locals 1

    .prologue
    .line 771
    iget-object v0, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCalendarView:Landroid/widget/CalendarView;

    invoke-virtual {v0}, Landroid/widget/CalendarView;->getFirstDayOfWeek()I

    move-result v0

    return v0
.end method

.method public getMaxDate()Ljava/util/Calendar;
    .locals 4

    .prologue
    .line 815
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 816
    .local v0, "maxDate":Ljava/util/Calendar;
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCalendarView:Landroid/widget/CalendarView;

    invoke-virtual {v1}, Landroid/widget/CalendarView;->getMaxDate()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 817
    return-object v0
.end method

.method public getMinDate()Ljava/util/Calendar;
    .locals 4

    .prologue
    .line 792
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 793
    .local v0, "minDate":Ljava/util/Calendar;
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCalendarView:Landroid/widget/CalendarView;

    invoke-virtual {v1}, Landroid/widget/CalendarView;->getMinDate()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 794
    return-object v0
.end method

.method public getMonth()I
    .locals 2

    .prologue
    .line 756
    iget-object v0, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCurrentDate:Ljava/util/Calendar;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v0

    return v0
.end method

.method public getSpinnersShown()Z
    .locals 1

    .prologue
    .line 856
    iget-object v0, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mSpinners:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->isShown()Z

    move-result v0

    return v0
.end method

.method public getYear()I
    .locals 2

    .prologue
    .line 751
    iget-object v0, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCurrentDate:Ljava/util/Calendar;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v0

    return v0
.end method

.method public init(IIILandroid/widget/DatePicker$OnDateChangedListener;)V
    .locals 0
    .param p1, "year"    # I
    .param p2, "monthOfYear"    # I
    .param p3, "dayOfMonth"    # I
    .param p4, "onDateChangedListener"    # Landroid/widget/DatePicker$OnDateChangedListener;

    .prologue
    .line 732
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->setDate(III)V

    .line 733
    invoke-direct {p0}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->updateSpinners()V

    .line 734
    invoke-direct {p0}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->updateCalendarView()V

    .line 735
    iput-object p4, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mOnDateChangedListener:Landroid/widget/DatePicker$OnDateChangedListener;

    .line 736
    return-void
.end method

.method public isEnabled()Z
    .locals 1

    .prologue
    .line 831
    iget-boolean v0, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mIsEnabled:Z

    return v0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 861
    iget-object v0, p1, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->setCurrentLocale(Ljava/util/Locale;)V

    .line 862
    return-void
.end method

.method public onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 1
    .param p1, "event"    # Landroid/view/accessibility/AccessibilityEvent;

    .prologue
    .line 893
    const-class v0, Landroid/widget/DatePicker;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityEvent;->setClassName(Ljava/lang/CharSequence;)V

    .line 894
    return-void
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 1
    .param p1, "info"    # Landroid/view/accessibility/AccessibilityNodeInfo;

    .prologue
    .line 898
    const-class v0, Landroid/widget/DatePicker;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClassName(Ljava/lang/CharSequence;)V

    .line 899
    return-void
.end method

.method public onPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 6
    .param p1, "event"    # Landroid/view/accessibility/AccessibilityEvent;

    .prologue
    .line 885
    const/16 v0, 0x14

    .line 886
    .local v0, "flags":I
    iget-object v2, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mContext:Landroid/content/Context;

    iget-object v3, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCurrentDate:Ljava/util/Calendar;

    invoke-virtual {v3}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v4

    const/16 v3, 0x14

    invoke-static {v2, v4, v5, v3}, Landroid/text/format/DateUtils;->formatDateTime(Landroid/content/Context;JI)Ljava/lang/String;

    move-result-object v1

    .line 888
    .local v1, "selectedDateUtterance":Ljava/lang/String;
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getText()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 889
    return-void
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .locals 4
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 871
    move-object v0, p1

    check-cast v0, Landroid/widget/DatePicker$SavedState;

    .line 872
    .local v0, "ss":Landroid/widget/DatePicker$SavedState;
    # getter for: Landroid/widget/DatePicker$SavedState;->mYear:I
    invoke-static {v0}, Landroid/widget/DatePicker$SavedState;->access$1100(Landroid/widget/DatePicker$SavedState;)I

    move-result v1

    # getter for: Landroid/widget/DatePicker$SavedState;->mMonth:I
    invoke-static {v0}, Landroid/widget/DatePicker$SavedState;->access$1200(Landroid/widget/DatePicker$SavedState;)I

    move-result v2

    # getter for: Landroid/widget/DatePicker$SavedState;->mDay:I
    invoke-static {v0}, Landroid/widget/DatePicker$SavedState;->access$1300(Landroid/widget/DatePicker$SavedState;)I

    move-result v3

    invoke-direct {p0, v1, v2, v3}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->setDate(III)V

    .line 873
    invoke-direct {p0}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->updateSpinners()V

    .line 874
    invoke-direct {p0}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->updateCalendarView()V

    .line 875
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Parcelable;)Landroid/os/Parcelable;
    .locals 6
    .param p1, "superState"    # Landroid/os/Parcelable;

    .prologue
    .line 866
    new-instance v0, Landroid/widget/DatePicker$SavedState;

    invoke-virtual {p0}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->getYear()I

    move-result v2

    invoke-virtual {p0}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->getMonth()I

    move-result v3

    invoke-virtual {p0}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->getDayOfMonth()I

    move-result v4

    const/4 v5, 0x0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Landroid/widget/DatePicker$SavedState;-><init>(Landroid/os/Parcelable;IIILandroid/widget/DatePicker$1;)V

    return-object v0
.end method

.method public setCalendarViewShown(Z)V
    .locals 2
    .param p1, "shown"    # Z

    .prologue
    .line 841
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCalendarView:Landroid/widget/CalendarView;

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/CalendarView;->setVisibility(I)V

    .line 842
    return-void

    .line 841
    :cond_0
    const/16 v0, 0x8

    goto :goto_0
.end method

.method protected setCurrentLocale(Ljava/util/Locale;)V
    .locals 6
    .param p1, "locale"    # Ljava/util/Locale;

    .prologue
    .line 908
    invoke-super {p0, p1}, Landroid/widget/DatePicker$AbstractDatePickerDelegate;->setCurrentLocale(Ljava/util/Locale;)V

    .line 910
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mTempDate:Ljava/util/Calendar;

    invoke-direct {p0, v1, p1}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->getCalendarForLocale(Ljava/util/Calendar;Ljava/util/Locale;)Ljava/util/Calendar;

    move-result-object v1

    iput-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mTempDate:Ljava/util/Calendar;

    .line 911
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMinDate:Ljava/util/Calendar;

    invoke-direct {p0, v1, p1}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->getCalendarForLocale(Ljava/util/Calendar;Ljava/util/Locale;)Ljava/util/Calendar;

    move-result-object v1

    iput-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMinDate:Ljava/util/Calendar;

    .line 912
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMaxDate:Ljava/util/Calendar;

    invoke-direct {p0, v1, p1}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->getCalendarForLocale(Ljava/util/Calendar;Ljava/util/Locale;)Ljava/util/Calendar;

    move-result-object v1

    iput-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMaxDate:Ljava/util/Calendar;

    .line 913
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCurrentDate:Ljava/util/Calendar;

    invoke-direct {p0, v1, p1}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->getCalendarForLocale(Ljava/util/Calendar;Ljava/util/Locale;)Ljava/util/Calendar;

    move-result-object v1

    iput-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCurrentDate:Ljava/util/Calendar;

    .line 915
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mTempDate:Ljava/util/Calendar;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Ljava/util/Calendar;->getActualMaximum(I)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mNumberOfMonths:I

    .line 916
    new-instance v1, Ljava/text/DateFormatSymbols;

    invoke-direct {v1}, Ljava/text/DateFormatSymbols;-><init>()V

    invoke-virtual {v1}, Ljava/text/DateFormatSymbols;->getShortMonths()[Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mShortMonths:[Ljava/lang/String;

    .line 918
    invoke-direct {p0}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->usingNumericMonths()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 921
    iget v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mNumberOfMonths:I

    new-array v1, v1, [Ljava/lang/String;

    iput-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mShortMonths:[Ljava/lang/String;

    .line 922
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mNumberOfMonths:I

    if-ge v0, v1, :cond_0

    .line 923
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mShortMonths:[Ljava/lang/String;

    const-string v2, "%d"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    add-int/lit8 v5, v0, 0x1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v0

    .line 922
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 926
    .end local v0    # "i":I
    :cond_0
    return-void
.end method

.method public setEnabled(Z)V
    .locals 1
    .param p1, "enabled"    # Z

    .prologue
    .line 822
    iget-object v0, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mDaySpinner:Landroid/widget/NumberPicker;

    invoke-virtual {v0, p1}, Landroid/widget/NumberPicker;->setEnabled(Z)V

    .line 823
    iget-object v0, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMonthSpinner:Landroid/widget/NumberPicker;

    invoke-virtual {v0, p1}, Landroid/widget/NumberPicker;->setEnabled(Z)V

    .line 824
    iget-object v0, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mYearSpinner:Landroid/widget/NumberPicker;

    invoke-virtual {v0, p1}, Landroid/widget/NumberPicker;->setEnabled(Z)V

    .line 825
    iget-object v0, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCalendarView:Landroid/widget/CalendarView;

    invoke-virtual {v0, p1}, Landroid/widget/CalendarView;->setEnabled(Z)V

    .line 826
    iput-boolean p1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mIsEnabled:Z

    .line 827
    return-void
.end method

.method public setFirstDayOfWeek(I)V
    .locals 1
    .param p1, "firstDayOfWeek"    # I

    .prologue
    .line 766
    iget-object v0, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCalendarView:Landroid/widget/CalendarView;

    invoke-virtual {v0, p1}, Landroid/widget/CalendarView;->setFirstDayOfWeek(I)V

    .line 767
    return-void
.end method

.method public setMaxDate(J)V
    .locals 5
    .param p1, "maxDate"    # J

    .prologue
    const/4 v3, 0x6

    const/4 v2, 0x1

    .line 799
    iget-object v0, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mTempDate:Ljava/util/Calendar;

    invoke-virtual {v0, p1, p2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 800
    iget-object v0, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mTempDate:Ljava/util/Calendar;

    invoke-virtual {v0, v2}, Ljava/util/Calendar;->get(I)I

    move-result v0

    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMaxDate:Ljava/util/Calendar;

    invoke-virtual {v1, v2}, Ljava/util/Calendar;->get(I)I

    move-result v1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mTempDate:Ljava/util/Calendar;

    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    move-result v0

    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMaxDate:Ljava/util/Calendar;

    invoke-virtual {v1, v3}, Ljava/util/Calendar;->get(I)I

    move-result v1

    if-eq v0, v1, :cond_0

    .line 811
    :goto_0
    return-void

    .line 804
    :cond_0
    iget-object v0, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMaxDate:Ljava/util/Calendar;

    invoke-virtual {v0, p1, p2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 805
    iget-object v0, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCalendarView:Landroid/widget/CalendarView;

    invoke-virtual {v0, p1, p2}, Landroid/widget/CalendarView;->setMaxDate(J)V

    .line 806
    iget-object v0, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCurrentDate:Ljava/util/Calendar;

    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMaxDate:Ljava/util/Calendar;

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->after(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 807
    iget-object v0, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCurrentDate:Ljava/util/Calendar;

    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMaxDate:Ljava/util/Calendar;

    invoke-virtual {v1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 808
    invoke-direct {p0}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->updateCalendarView()V

    .line 810
    :cond_1
    invoke-direct {p0}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->updateSpinners()V

    goto :goto_0
.end method

.method public setMinDate(J)V
    .locals 5
    .param p1, "minDate"    # J

    .prologue
    const/4 v3, 0x6

    const/4 v2, 0x1

    .line 776
    iget-object v0, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mTempDate:Ljava/util/Calendar;

    invoke-virtual {v0, p1, p2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 777
    iget-object v0, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mTempDate:Ljava/util/Calendar;

    invoke-virtual {v0, v2}, Ljava/util/Calendar;->get(I)I

    move-result v0

    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMinDate:Ljava/util/Calendar;

    invoke-virtual {v1, v2}, Ljava/util/Calendar;->get(I)I

    move-result v1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mTempDate:Ljava/util/Calendar;

    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    move-result v0

    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMinDate:Ljava/util/Calendar;

    invoke-virtual {v1, v3}, Ljava/util/Calendar;->get(I)I

    move-result v1

    if-eq v0, v1, :cond_0

    .line 788
    :goto_0
    return-void

    .line 781
    :cond_0
    iget-object v0, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMinDate:Ljava/util/Calendar;

    invoke-virtual {v0, p1, p2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 782
    iget-object v0, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCalendarView:Landroid/widget/CalendarView;

    invoke-virtual {v0, p1, p2}, Landroid/widget/CalendarView;->setMinDate(J)V

    .line 783
    iget-object v0, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCurrentDate:Ljava/util/Calendar;

    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMinDate:Ljava/util/Calendar;

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->before(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 784
    iget-object v0, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mCurrentDate:Ljava/util/Calendar;

    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mMinDate:Ljava/util/Calendar;

    invoke-virtual {v1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 785
    invoke-direct {p0}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->updateCalendarView()V

    .line 787
    :cond_1
    invoke-direct {p0}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->updateSpinners()V

    goto :goto_0
.end method

.method public setSpinnersShown(Z)V
    .locals 2
    .param p1, "shown"    # Z

    .prologue
    .line 851
    iget-object v1, p0, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->mSpinners:Landroid/widget/LinearLayout;

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 852
    return-void

    .line 851
    :cond_0
    const/16 v0, 0x8

    goto :goto_0
.end method

.method public updateDate(III)V
    .locals 1
    .param p1, "year"    # I
    .param p2, "month"    # I
    .param p3, "dayOfMonth"    # I

    .prologue
    .line 740
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->isNewDate(III)Z

    move-result v0

    if-nez v0, :cond_0

    .line 747
    :goto_0
    return-void

    .line 743
    :cond_0
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->setDate(III)V

    .line 744
    invoke-direct {p0}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->updateSpinners()V

    .line 745
    invoke-direct {p0}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->updateCalendarView()V

    .line 746
    invoke-direct {p0}, Landroid/widget/DatePicker$DatePickerSpinnerDelegate;->notifyDateChanged()V

    goto :goto_0
.end method