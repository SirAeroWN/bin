#Will Norvelle
#wmn2bz
#11/02/16 
#checkzca.sh

unbalance=`curl -s 'http://zcash.flypool.org/api/miner_new/t1MEGqAZrURx8kpQi3KLSXT1fNkQqoxQsEB' | python -c "import sys, json; print(float(json.load(sys.stdin)['unpaid']) * (10**-8))"`
echo "unpaid balance: $unbalance"
zecusd=`curl -s 'https://api.coinmarketcap.com/v1/ticker/zcash/' | python -c "import sys, json; print(json.load(sys.stdin)[0]['price_usd'])"`
echo "ZEC to USD: \$$zecusd"
usd=`awk "BEGIN {print $unbalance * $zecusd}"`
#usd=`echo '"$unbalance" * "$zecusd"' | bc -l`
echo "unpaid balance in USD: \$$usd"