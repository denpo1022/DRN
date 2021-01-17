# After put all the frames of the video into Set5/HR/ , run this .sh

# rm ./srdata/benchmark/Set5/HR/*
rm -f ./srdata/benchmark/Set5/LR_bicubic/X2/*
rm -f ./srdata/benchmark/Set5/LR_bicubic/X4/*
rm -f ./experiments/results/Set5/x4/*

for file in ./srdata/benchmark/Set5/HR/*; do
    name=${file##*/}
    x2="${name::-4}x2.png"
    x4="${name::-4}x4.png"
    cp $file "./srdata/benchmark/Set5/LR_bicubic/X2/${x2}"
    cp $file "./srdata/benchmark/Set5/LR_bicubic/X4/${x4}"
done

python main.py --data_dir ./srdata \
    --save ./experiments \
    --data_test Set5 \
    --scale 4 \
    --model DRN-L \
    --pre_train ./pretrained_models/DRNL4x.pt \
    --pre_train_dual ./pretrained_models/DRNL4x_dual_model.pt \
    --n_GPUs 4 \
    --test_only \
    --save_results
