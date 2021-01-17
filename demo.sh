python main.py --data_dir ./srdata \
    --save ./experiments \
    --data_test Set5 \
    --scale 4 \
    --model DRN-L \
    --pre_train ./pretrained_models/DRNL4x.pt \
    --test_only \
    --save_results
