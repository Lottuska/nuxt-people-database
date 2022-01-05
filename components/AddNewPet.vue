<template>
    <div>
        <v-btn
            class="ma-2"
            color="primary"
            @click="dialog = true"
        >
            <v-icon class="mr-2">mdi-plus</v-icon>
            Add a new pet
        </v-btn>
        <v-dialog
            v-model="dialog"
            max-width="400px"
        >
            <v-card>
                <v-card-title>Add a new pet</v-card-title>
                <v-card-text>
                    <v-container>
                        <v-row class="pa-0 ma-0">
                            <v-col cols="4" class="pa-0 ma-0">
                                <v-subheader>Name</v-subheader>
                            </v-col>
                            <v-col cols="8" class="pa-0 ma-0">
                                <v-text-field
                                    v-model="name"
                                    label="Name"
                                    solo
                                    outlined
                                    clearable
                                ></v-text-field>
                            </v-col>
                        </v-row>
                        <v-row class="pa-0 ma-0">
                            <v-col cols="4" class="pa-0 ma-0">
                                <v-subheader>Specie</v-subheader>
                            </v-col>
                            <v-col cols="8" class="pa-0 ma-0">
                                <v-select
                                    :items="species"
                                    v-model="specieid"
                                    label="Specie"
                                    :item-text="item  => item.name"
                                    item-value="id"
                                    solo
                                    outlined
                                    clearable
                                ></v-select>
                            </v-col>
                        </v-row>
                        <v-row class="pa-0 ma-0">
                            <v-col cols="4" class="pa-0 ma-0">
                                <v-subheader>Owner</v-subheader>
                            </v-col>
                            <v-col cols="8" class="pa-0 ma-0">
                                <v-select
                                    :items="owners"
                                    v-model="ownerid"
                                    label="Owner"
                                    :item-text="item => item.firstname +' '+ item.lastname"
                                    item-value="id"
                                    solo
                                    outlined
                                    clearable
                                >
                                </v-select>
                            </v-col>
                        </v-row>
                    </v-container>
                </v-card-text>
                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn
                        color="primary"
                        text
                        @click="dialog = false"
                    >
                        Close
                    </v-btn>
                    <v-btn
                        color="primary"
                        @click="addPet"
                    >
                        Submit
                    </v-btn>
                </v-card-actions>
            </v-card>
        </v-dialog>
    </div>
</template>

<script>
export default {
  name: 'AddNewPet',
  data () {
    return {
      dialog: false,
      menu: false,
      owners: [],
      species: [],
      name: '',
      specieid: '',
      ownerid: ''
    }
  },
  created () {
    this.getOwners()
    this.getSpecies()
  },
  methods: {
    addPet () {
      try {
        this.$axios.post('/api/newpet', {
          name: this.name,
          specieid: this.specieid,
          ownerid: this.ownerid
        })
          .then(
            this.dialog = false
          )
      } catch (err) {
        console.log(err)
      }
    },
    getSpecies () {
      try {
        this.$axios.get('/api/petspecies')
          .then((response) => {
            this.species = response.data
          })
      } catch (err) {
        console.log(err)
      }
    },
    getOwners () {
      try {
        this.$axios.get('/api/people')
          .then((response) => {
            this.owners = response.data
          })
      } catch (err) {
        console.log(err)
      }
    }
  }
}
</script>

<style>
</style>
