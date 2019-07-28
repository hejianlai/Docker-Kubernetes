#
{{- define "api.livenessProbe" -}}
          httpGet:
            path: /actuator/health
            port: 8081
            scheme: HTTP
          initialDelaySeconds: 200
          timeoutSeconds: 5
          successThreshold: 1
          failureThreshold: 5
{{- end }}

{{- define "api.readinessProbe" -}}
          httpGet:
            path: /actuator/health
            port: 8081
            scheme: HTTP
          initialDelaySeconds: 100
          timeoutSeconds: 5
          successThreshold: 1
          failureThreshold: 5
{{- end }}

{{- define "front.livenessProbe" -}}
          httpGet:
            path: /nginx-health
            port: 80
            scheme: HTTP
          initialDelaySeconds: 20 ## equals to the maximum startup time of the application + couple of seconds
          timeoutSeconds: 1 #探测超时时间。默认1秒，最小1秒。
{{- end }}

{{- define "front.readinessProbe" -}}
          httpGet:
            path: /nginx-health
            port: 80
            scheme: HTTP
          initialDelaySeconds: 10 ## equals to the maximum startup time of the application + couple of seconds
          timeoutSeconds: 1 #探测超时时间。默认1秒，最小1秒。
{{- end }}

{{- define "api.strategy" -}}
  strategy:
    rollingUpdate:
      maxSurge: 1      #滚动升级时会先启动1个pod
      maxUnavailable: 1 #滚动升级时允许的最大Unavailable的pod个数
{{- end -}}

{{- define "front.strategy" -}}
  strategy:
    rollingUpdate:
      maxSurge: 2      #滚动升级时会先启动1个pod
      maxUnavailable: 1 #滚动升级时允许的最大Unavailable的pod个数
{{- end -}}

#时区同步
{{- define "volumeMounts.hostTime" -}}
        - name: host-time
          mountPath: /etc/localtime
{{- end -}}

{{- define "volumes.hostTime" -}}
      - name: host-time
        hostPath:
          path: /etc/localtime
{{- end -}}

