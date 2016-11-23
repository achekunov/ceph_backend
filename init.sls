
/etc/ceph:
  file.directory:
  - user: root
  - group: root
  - mode: 755
  - makedirs: True

/etc/ceph/{{ ceph_cluster }}.conf:
  file.managed:
  - source: salt://ceph_backend/files/ceph.conf
  - template: jinja
  - mode: 644
  - defaults:
      ceph_backend_mon_host: {{ ceph_backend_mon_host }}
      ceph_backend_mon_port: {{ ceph_backend_mon_port }}

/etc/ceph/{{ ceph_cluster }}.client.{{ ceph_user }}.keyring:
  file.managed:
  - source: salt://ceph_backend/files/keyring
  - template: jinja
  - user: {{ ceph_user }}
  - group: {{ ceph_user }}
  - mode: 600
  - defaults:
      ceph_backend_user: {{ ceph_user }}
      client_key: {{ ceph_key }}
