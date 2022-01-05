<template>
    <div>
        <v-btn
            icon
            class="my-2"
            @click="dialog = true"
        >
            <v-icon>mdi-eye</v-icon>
        </v-btn>
        <v-dialog
            v-model="dialog"
            max-width="400px"
        >
            <v-card>
                <v-card-title>{{ person.firstname }} {{ person.lastname }}</v-card-title>
                <v-card-text>
                    <v-container>
                        <v-row class="pa-0 ma-0">
                            <v-col cols="4" class="pa-0 ma-0">
                                <p>Firstname</p>
                            </v-col>
                            <v-col cols="8" class="pa-0 ma-0">
                                <p>{{ person.firstname }}</p>
                            </v-col>
                        </v-row>
                        <v-row class="pa-0 ma-0">
                            <v-col cols="4" class="pa-0 ma-0">
                                <p>Lastname</p>
                            </v-col>
                            <v-col cols="8" class="pa-0 ma-0">
                                <p>{{ person.lastname }}</p>
                            </v-col>
                        </v-row>
                        <v-row class="pa-0 ma-0">
                            <v-col cols="4" class="pa-0 ma-0">
                                <p>Birthday</p>
                            </v-col>
                            <v-col cols="8" class="pa-0 ma-0">
                                <p>{{ formatBirthday(person.birthday) }}</p>
                            </v-col>
                        </v-row>
                        <v-row v-if="pets.length" class="pa-0 ma-0">
                            <v-col cols="4" class="pa-0 ma-0">
                                <p>Pets</p>
                            </v-col>
                            <v-col cols="8" class="pa-0 ma-0">
                                <v-chip v-for="(pet, index) in pets" :key="index" class="mx-1 mb-1" small>
                                    {{ pet.name }} ({{ pet.specie_name }})
                                </v-chip>
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
                </v-card-actions>
            </v-card>
        </v-dialog>
    </div>
</template>

<script>
export default {
  name: 'PersonDetails',
  props: ['person'],
  data () {
    return {
      species: [],
      pets: [],
      dialog: false,
      menu: false,
      id: this.person.id,
      firstname: this.person.firstname,
      lastname: this.person.lastname,
      birthday: this.person.birthday
    }
  },
  created () {
    this.formatBirthday()
    this.showPets()
  },
  methods: {
    showPets () {
      try {
        this.$axios.post('/api/pets', {
          ownerid: this.id
        })
          .then((response) => {
            this.pets = response.data
          })
      } catch (err) {
        console.log(err)
      }
    },
    formatBirthday () {
      const formattedBirthday = this.birthday.split('', 10).join('')
      this.birthday = formattedBirthday
      return this.birthday
    }
  }
}
</script>

<style>
</style>
