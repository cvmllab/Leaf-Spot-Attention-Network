# Leaf Spot Attention Network for Leaf Disease Identification

This code is an implementation of our paper "Leaf spot attention network for apple leaf disease identification" published in IEEE/CVF Conference on Computer Vision and Pattern Recognition (IEEE CVPR), Agriculture-Vision Workshop, 2020. Download the paper : https://openaccess.thecvf.com/content_CVPRW_2020/papers/w5/Yu_Leaf_Spot_Attention_Network_for_Apple_Leaf_Disease_Identification_CVPRW_2020_paper.pdf

The proposed model can be used not only for apple leaves, but also for classification of various leaf diseases.

This source code was implemented in Matlab 2019a version and tested on Window 10.

-     'train.m' is the source code to train the proposed leaf spot attention network.
-     'evaluate.m' is the source code to test the pretrained network.

For reference, more training images are added to train our leaf spot attention network. Therefore, its classification results are slightly different from those in the paper.

The dataset and our pretrained network can be downloaded.

Dataset : https://drive.google.com/file/d/1zSRzOvAQydPufVLcCzYRWgunNVztBUxe/view?usp=sharing

Network : https://drive.google.com/file/d/19rUDzQ_JN0IWUvvLvN6qtG2QRC7GZAM6/view?usp=sharing

# Dataset

All apple leaf images used in this study were provided by the Apple Research Institute in our country. The apple leaf images were categorized into three groups, according to two types of leaf diseases and normal leaf.

- The number of normal leaves is 558
- The number of marssonia blotch leaves is 2281
- The number of alternaria leaves is 896

![image](https://user-images.githubusercontent.com/73872706/116661105-e5e0bc80-a9ce-11eb-85d7-949bb04c32fa.png)

Figure. Example of apple leaf images: normal leaf images (first row), diseased leaf images with marssonia blotch (second row), and diseased leaf images with alternaria leaf spot (third row).


# Experimental results

![결과](https://user-images.githubusercontent.com/73872706/127420589-87841bf4-7416-4863-9ffe-6f9a8aaceb51.PNG)


