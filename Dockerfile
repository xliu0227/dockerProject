from node:alpine as builder

workdir '/app'

copy package.json .
run npm install
copy . .

run npm run build

#above is build phase

#below is run phase
from nginx
copy --from=builder /app/build /usr/share/nginx/html
#default command will be run for ngix's container