%%%%%%%%%%%%%%%%%%%%%%%
% evaluation function %
%%%%%%%%%%%%%%%%%%%%%%%

function [results] = evaluate(label_true,label_predict,dec_values,topN)
pos_class = 1; % 1 as fraud label
neg_class = 0; % 0 as non-fraud label
assert(length(label_true)==length(label_predict));
assert(length(label_true)==length(dec_values));

% calculate metric: AUC
[X,Y,T,AUC,OPTROCPT,SUBY,SUBYNAMES] = perfcurve(label_true,dec_values,pos_class,'negClass',neg_class);
results.auc = AUC;
results.auc_optimalPT = OPTROCPT;
results.roc_X = X;
results.roc_Y = Y;
% plot(X,Y);
% xlabel('False positive rate'); ylabel('True positive rate');
% title('ROC curve');

% calculate metric: sensitivity, specificity, and BAC (balanced accuracy) by using default cut-off thresh of classifier
tp=sum(label_true==pos_class & label_predict==pos_class);
fn=sum(label_true==pos_class & label_predict==neg_class);
tn=sum(label_true==neg_class & label_predict==neg_class);
fp=sum(label_true==neg_class & label_predict==pos_class);
sensitivity = tp/(tp+fn);
specificity = tn/(tn+fp);
results.bac = (sensitivity+specificity)/2;
results.sensitivity=sensitivity;
results.specificity=specificity;

% calculate metric: precision, sensitivity, specificity, and BAC (balanced accuracy) by using topN% cut-off thresh
k = round(length(label_true)*topN);
[~,idx] = sort(dec_values,'descend');
label_predict_topk = ones(length(label_true),1)*neg_class;
label_predict_topk(idx(1:k))=1;
tp_topk=sum(label_true==pos_class & label_predict_topk==pos_class);
fn_topk=sum(label_true==pos_class & label_predict_topk==neg_class);
tn_topk=sum(label_true==neg_class & label_predict_topk==neg_class);
fp_topk=sum(label_true==neg_class & label_predict_topk==pos_class);
sensitivity_topk = tp_topk/(tp_topk+fn_topk);
specificity_topk = tn_topk/(tn_topk+fp_topk);
results.bac_topk = (sensitivity_topk+specificity_topk)/2;
precision_topk = tp_topk/(tp_topk+fp_topk);
results.sensitivity_topk=sensitivity_topk;
results.specificity_topk=specificity_topk;
results.precision_topk = precision_topk;


% calculate metric: NDCG@k
hits = sum(label_true==pos_class);
kz=min(k,hits);
z=0.0;
for i=1:kz
    rel = 1;
    z = z+ (2^rel-1)/log2(1+i);
end
dcg_at_k=0.0;
for i=1:k
    if label_true(idx(i))==1
        rel = 1;
        dcg_at_k = dcg_at_k + (2^rel-1)/log2(1+i);
    end
end
if z~=0
    ndcg_at_k = dcg_at_k/z;
else
    ndcg_at_k = 0;
end
results.ndcg_at_k = ndcg_at_k;

end
