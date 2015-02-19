### Title: Trees in the world
###
### Author: Michael Koontz (mikoontz@gmail.com)
###
### Date Created: 20150218
### Last Updated: 20150218
###
### Purpose: Back of the envelope calculation for the total number of trees in the world.

# From Hansen et al. Science (2013)
cover <- data.frame(cover=c("<25", "26-50", "51-75", "76-100"), km.squared=c(86958989, 8610500, 9330575, 23512797), percent=c(0.25/2, ((26+50)/2), ((51+75)/2), ((100+76)/2)))

# Convert square kilometers to hectares
cover$hectares <- cover$km.squared*100
cover

# From Slik et al. Global Ecology and Biogeography (2010)
# ~600 stems per hectare in dense (?) tropical rainforest
# Assume stem density scales linearly with tree cover, so just multiply percent cover of category (as the midpoint of the range) by the total area to scale the stem density to tree cover. Then multiply by mean from Borneo study

cover$tree.num <- cover$hectares*(cover$percent*0.01)*600
# Approximate upper bound for total number of trees >1.4m
sum(cover$tree.num)

