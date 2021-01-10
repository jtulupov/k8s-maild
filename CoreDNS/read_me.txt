Имеется две идеи как внести DNS записи в CoreDNS

1. Посредством директивы hosts ( https://coredns.io/plugins/hosts/ )
Пример в yaml файле cm_coredns_hosts.yaml 
Ограничение: поведение равноценно /etc/hosts, т.е. только A запись и
соответсвующая PTR

2. Более выигрышный вариант. Вносим полноценную DNS зону с произвольными
ресурсными записями.
Пример yaml файла на https://coredns.io/2017/05/08/custom-dns-entries-for-kubernetes/
Дирктива "file" https://coredns.io/plugins/file/
