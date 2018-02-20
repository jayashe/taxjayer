#!/bin/bash
cookie=`cat cookie.txt`
domain=`cat domain.txt`
while read p; do
  arrIN=(${p//,/ })
  name="${arrIN[0]}"
  buy_date="${arrIN[1]}"
  sell_date="${arrIN[2]}"
  proceed="${arrIN[3]}"
  cost="${arrIN[4]}"

  buy_date_split=(${buy_date//\// })
  buy_month="${buy_date_split[0]}"
  buy_day="${buy_date_split[1]}"
  buy_year="${buy_date_split[2]}"

  sell_date_split=(${sell_date//\// })
  sell_month="${sell_date_split[0]}"
  sell_day="${sell_date_split[1]}"
  sell_year="${sell_date_split[2]}"

  echo "---Adding row for $name---"

  curl -s -X POST \
    "https://$domain/2017/avalon/Income/CapGains" \
    -H 'cache-control: no-cache' \
    -H 'content-type: application/x-www-form-urlencoded' \
    -H "cookie: $cookie" \
    -d "SchDID=0&isNew=True&OwnerTS=T&Descrip=$name&AltDtAcquiredOpt=false&DtAcquired.M=$buy_month&DtAcquired.D=$buy_day&DtAcquired.Y=$buy_year&AltDtAcquired=0&AltDtSoldOpt=false&isShortSale=false&DtSold.M=$sell_month&DtSold.D=$sell_day&DtSold.Y=$sell_year&AltDtSold=0&AltPriceOpt=false&Price=$proceed&AltPrice=0&DType=A&AltCostOpt=false&Cost=$cost&AltCost=0&AdjustmentGainLoss=&AdjustCode_B=false&AdjustCode_T=false&AdjustCode_N=false&AdjustCode_H=false&AdjustCode_D=false&AdjustCode_Q=false&AdjustCode_X=false&AdjustCode_R=false&AdjustCode_W=false&AdjustCode_L=false&AdjustCode_E=false&AdjustCode_S=false&AdjustCode_C=false&AdjustCode_M=false&AdjustCode_O=false&isCollectExch=false&SaveAndAddAnother=True" \
    > /dev/null
done <stocks.csv
