<template>
    <div>
        <v-btn
            icon
            class="my-2"
            @click="dialog = true"
        >
            <v-icon>mdi-delete</v-icon>
        </v-btn>
        <v-dialog
            v-model="dialog"
            max-width="400px"
        >
            <v-card>
                <v-card-title>Delete person "{{ person.firstname }} {{ person.lastname }}"?</v-card-title>
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
                        @click="deletePerson"
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
  name: 'DeletePerson',
  props: ['person'],
  data () {
    return {
      dialog: false,
      menu: false,
      id: this.person.id
    }
  },
  methods: {
    deletePerson () {
      try {
        this.$axios.post('/api/deleteperson', {
          id: this.id
        })
          .then(
            this.dialog = false
          )
      } catch (err) {
        console.log(err)
      }
    }
  }
}
</script>

<style>
</style>
