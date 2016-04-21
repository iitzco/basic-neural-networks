# Simple Perceptron

Implementation of a simple Simple Perceptron to solve linearly separable bit functions.

![img](https://blog.dbrgn.ch/images/2013/3/26/perceptron.png)

## Requirements

* **[Octave](https://www.gnu.org/software/octave/)**

## How to use

To obtain a trained neural network:

```
net = obtain_network(N, training_set, error, @ft, learning_rate, graph)
```

*Where:*

- *N: size of input*
- *training_set: cell array containing*
	- *training_set{1}: matrix with an entry in each row*
	- *training_set{2}: single columns with the outputs of corresponding entries*
- *error: minimum error to stop training*
- *@ft: transformation function*
- *learning_rate: learning speed*
- *graph: plot at end or not (boolean value)*

Having the net, you can execute it with:

```
evaluate_net(net,entry)
```

### Important

In order to get the **training_set**, you can call

```
training_set = get_training_set(@ft, bits)
```

*Where @ft is a function (for example, AND) and bits is the size of the entry*

**For example:**


```
training_set = get_training_set(@and, 3);
```

**training_set{1}**: 

```
	0 0 0
	0 0 1 	
	0 1 0 
	0 1 1 
	1 0 0 
	1 0 1 
	1 1 0
	1 1 1 
```
**training_set{2}**

```
	0
	0
	0
	0
	0
	0
	0
	1
```


# Example

```
net = obtain_network(10, get_training_set(@and,10), 0, @step_ft, 0.5, true)

evalueate_net(net,[0,0,0,1,0,1,0,1,0,0])
% Must be 0

evalueate_net(net,[1,1,1,1,1,1,1,1,1,1])
% Must be 1
```
