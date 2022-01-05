<template>
  <v-row justify="center" align="center">
    <v-col>
      <v-row class="pa-1">
        <AddNewPerson />
        <AddNewPet />
      </v-row>
      <PeopleList />
    </v-col>
  </v-row>
</template>

<script>
import PeopleList from '../components/PeopleList'
import AddNewPerson from '../components/AddNewPerson'
import AddNewPet from '../components/AddNewPet'

export default {
  name: 'IndexPage',
  components: {
    PeopleList,
    AddNewPerson,
    AddNewPet
  }
}
</script>
