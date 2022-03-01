# **PneumoDoc** 🩺

## **An app to detect Pneumonia using Deep Learning 🧠📱**
- In this project **two models ANN and CNN** were built from scratch using **TensorFlow and Keras**
- The problem statement is to detect whether patient is having pneumonia or not by training models with x-ray images
- **Data Augmentation** was performed and the main reason behind it is to provide maximum randomness to the training data where we use a function to shuffle images, make minor changes, and save images accordingly because it is a good practice to provide as much randomness as possible in order to achieve good accuracy on real-time data and testing data
- **Separable Convolutional layers** were used which proved to be more robust and powerful
- After Comparing the accuracies of both the deep learning models best model was selected for further deployment on android application
- The model was converted in **.tflite** format in order to deploy it using TensorFlowlite dependencies in flutter
- UI of app was done using Flutter and Dart while functionalities were implemented using **TensorFlowlite** libraries
- The app enables user to click an image of x-ray or select the image from app storage or drive to check the results
- UI is configured in such a way that the result is displayed on the screen
- If patient has pneumonia a short and useful prescription from experienced doctors is made available in the app itself
- The models were built on **Google Colab** by fetching data through **Kaggle API**

##⭐ **DataSet**
![image](https://user-images.githubusercontent.com/78098329/156110186-0e3dc2d5-1bd5-4f4d-9148-4997d42d5b82.png)


##⭐ **Training and Validating Accuracies** 📉
- #### Artificial Neural Network Model
![image](https://user-images.githubusercontent.com/78098329/156110930-a027720b-2355-47d5-98a3-86af69492d5b.png)

- #### Convolutional Neural Network Model
![image](https://user-images.githubusercontent.com/78098329/156114016-172b1a12-8734-410b-8bdb-e585031d04c1.png)

##⭐ **Train and Test Metrics**
- #### Artificial Neural Network Model
![image](https://user-images.githubusercontent.com/78098329/156114044-511c6a8b-9585-433c-ba40-4182e5c7ab8c.png)

- #### Convolutional Neural Network Model
![image](https://user-images.githubusercontent.com/78098329/156114064-6e666378-57d3-4d84-9a0c-b1a2a32947be.png)

##⭐ User Interface using Flutter
![image](https://user-images.githubusercontent.com/78098329/156112145-c7043140-c068-4667-ba0e-728774bdd676.png)       ![image](https://user-images.githubusercontent.com/78098329/156111802-b06c32f5-9f6b-4714-a6d6-58c2791ec16a.png)


![image](https://user-images.githubusercontent.com/78098329/156111769-bd3c501b-32d6-4cdd-a3fc-6a0b8880ec4f.png)       ![image](https://user-images.githubusercontent.com/78098329/156112226-2aa97aa6-a294-4305-88d6-a75e050c5cc4.png)


##⭐ **Libraries**
- Tensorflow
- Matplotlib
- Keras
- Numpy
- Pandas

##⭐ **Flutter Dependencies**
- tflite: ^1.0.2
- image_picker: ^0.8.4+4
- flutter_svg: ^0.23.0+1

##⭐ **Technologies used**
- Google Colab
- Jupyter Notebook
- Flutter
