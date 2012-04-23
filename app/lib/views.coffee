GG.MainView = Ember.View.extend
  templateName: 'main-view'


GG.DrakeView = Ember.View.extend
  tagName            : 'img'
  attributeBindings  : ['src', 'width']
  srcBinding         : 'content.imageURL'
  width              : 200


GG.ParentPoolView = Ember.View.extend
  children: null

  drakeSelected: (evt) ->
    if drake = evt.context
      whichParent = if drake.get('sex') is 0 then 'selectedMother' else 'selectedFather'
      GG.parentController.set whichParent, drake


GG.AllelesView = Ember.View.extend
  tagName: 'span'

  allelesString: (->
    genotype = @getPath 'content.visibleGenotype'
    genotype.a.concat(genotype.b).join(',')
  ).property('content.visibleGenotype').cacheable()