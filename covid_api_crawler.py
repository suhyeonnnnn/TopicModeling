key = 'Pf7Cq8aw/aV2P5tHo3BCK+Xgl+dsoQKB1LSvxQmxd/SuYONRR2mi29Z4cUIgte+XiKI4Ul/CcL8Axu1lShxN0w=='
url = 'http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19SidoInfStateJson?serviceKey={}&pageNo=1&numOfRows=10&startCreateDt=20200410&endCreateDt=20200410'.format(key)

import requests
content = requests.get(url).content
print(content)