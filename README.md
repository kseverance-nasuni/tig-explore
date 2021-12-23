# TIG Stack

An toy Telegraf-InfluxDB-Grafana stack with an HTTP endpoint send various metrics
into the system.

## Usage

```
docker-compose up
```

Connect to Grafana, [localhost:3000](http://localhost:3000), and log in with `admin`/`admin`
and open the GFA dashboard.

You can see the data returned by the HTTP endpoint at, [localhost:4000](http://localhost:4000/api/points)
