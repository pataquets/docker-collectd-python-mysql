FROM pataquets/collectd-python-pip

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get -y install libmysqlclient-dev \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN pip install mysqlclient

ADD \
  https://raw.githubusercontent.com/chrisboulton/collectd-python-mysql/master/mysql.py \
  /opt/collectd/lib/collectd/plugins/python/
