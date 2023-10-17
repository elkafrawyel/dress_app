class ProfileResponse {
  ProfileResponse({
    this.tickers,
    this.total,
    this.creditBalance,
    this.balance,
    this.profit,
    this.equity,
    this.freeMargin,
    this.usedMargin,
    this.marginLevel,
    this.isStopOut,
    this.isMarginCall,
    this.investorAccountID,
  });

  ProfileResponse.fromJson(dynamic json) {
    if (json['Tickers'] != null) {
      tickers = [];
      json['Tickers'].forEach((v) {
        tickers?.add(Tickers.fromJson(v));
      });
    }
    total = json['Total'];
    creditBalance = json['CreditBalance'];
    balance = json['Balance'];
    profit = json['Profit'];
    equity = json['Equity'];
    freeMargin = json['FreeMargin'];
    usedMargin = json['UsedMargin'];
    marginLevel = json['MarginLevel'];
    isStopOut = json['IsStopOut'];
    isMarginCall = json['IsMarginCall'];
    investorAccountID = json['InvestorAccountID'];
  }

  List<Tickers>? tickers;
  num? total;
  num? creditBalance;
  num? balance;
  num? profit;
  num? equity;
  num? freeMargin;
  num? usedMargin;
  num? marginLevel;
  bool? isStopOut;
  bool? isMarginCall;
  num? investorAccountID;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (tickers != null) {
      map['Tickers'] = tickers?.map((v) => v.toJson()).toList();
    }
    map['Total'] = total;
    map['CreditBalance'] = creditBalance;
    map['Balance'] = balance;
    map['Profit'] = profit;
    map['Equity'] = equity;
    map['FreeMargin'] = freeMargin;
    map['UsedMargin'] = usedMargin;
    map['MarginLevel'] = marginLevel;
    map['IsStopOut'] = isStopOut;
    map['IsMarginCall'] = isMarginCall;
    map['InvestorAccountID'] = investorAccountID;
    return map;
  }
}

class Tickers {
  Tickers({
    this.tickerID,
    this.tickerSymbol,
    this.quantity,
    this.marginReq,
    this.value,
  });

  Tickers.fromJson(dynamic json) {
    tickerID = json['TickerID'];
    tickerSymbol = json['TickerSymbol'];
    quantity = json['Quantity'];
    marginReq = json['MarginReq'];
    value = json['Value'];
  }

  num? tickerID;
  String? tickerSymbol;
  num? quantity;
  num? marginReq;
  num? value;

  Tickers copyWith({
    num? tickerID,
    String? tickerSymbol,
    num? quantity,
    num? marginReq,
    num? value,
  }) =>
      Tickers(
        tickerID: tickerID ?? this.tickerID,
        tickerSymbol: tickerSymbol ?? this.tickerSymbol,
        quantity: quantity ?? this.quantity,
        marginReq: marginReq ?? this.marginReq,
        value: value ?? this.value,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['TickerID'] = tickerID;
    map['TickerSymbol'] = tickerSymbol;
    map['Quantity'] = quantity;
    map['MarginReq'] = marginReq;
    map['Value'] = value;
    return map;
  }
}
