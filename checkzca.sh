#Will Norvelle
#wmn2bz
#11/02/16 
#checkzca.sh

curl -s 'http://zcash.flypool.org/api/miner_new/t1MEGqAZrURx8kpQi3KLSXT1fNkQqoxQsEB' | python -c "import sys, json; print(float(json.load(sys.stdin)['unpaid']) * (10**-8))"