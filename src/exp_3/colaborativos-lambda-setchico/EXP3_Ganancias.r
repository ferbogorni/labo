rm( list= ls(all.names= TRUE) )  #remove all objects
gc( full= TRUE )                 #garbage collection

require("data.table")


dataset_grande <- fread("~/buckets/b1/datasets/competencia_2023.csv.gz") 
#
# Cambiar para cada salida de script ZZ final y cada semilla
dataset_pred <- fread("~/buckets/b1/exp/ZZ6910-FER-3A5/pred_01_047.csv")

dataset_pred[dataset_grande,
             on= c("numero_de_cliente","foto_mes"),
             clase_ternaria:=i.clase_ternaria]

dataset_pred[,ganancia:=-3000]
dataset_pred[clase_ternaria=="BAJA+2",ganancia:=117000]
setorder(dataset_pred,-prob)

dataset_pred[,ganancia_acumulada:=cumsum(ganancia)]

dataset_pred[,envios:=.I]

fwrite(dataset_pred[1:20000],"~/buckets/b1/exp/zz701/3A5_pred_01_047_graficar.csv")
