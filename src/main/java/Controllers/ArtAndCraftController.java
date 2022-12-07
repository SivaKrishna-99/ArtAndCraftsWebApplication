package Controllers;

import Repository.ArtAndCraftRepository;
import Repository.TransactionRepository;
import model.ArtAndCraft;
import model.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;
@RestController
@RequestMapping("/artandcrafts")
public class ArtAndCraftController {

    @Autowired
    private ArtAndCraftRepository artAndCraftRepository;

    @GetMapping
    public ResponseEntity<List<ArtAndCraft>> getArtAndCrafts() {
        List<ArtAndCraft> artAndCrafts = artAndCraftRepository.findAll();
        return new ResponseEntity<>(artAndCrafts, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<ArtAndCraft> getArtAndCraft(@PathVariable Long id) {
        Optional<ArtAndCraft> artAndCraft = artAndCraftRepository.findById(id);
        if (artAndCraft.isPresent()) {
            return new ResponseEntity<>(artAndCraft.get(), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping("/title/{title}")
    public ResponseEntity<List<ArtAndCraft>> getArtAndCraftsByTitle(@PathVariable String title) {
        List<ArtAndCraft> artAndCrafts = artAndCraftRepository.findByTitleContainingIgnoreCase(title);
        return new ResponseEntity<>(artAndCrafts, HttpStatus.OK);
    }

    @PostMapping
    public ResponseEntity<ArtAndCraft> createArtAndCraft(@RequestBody ArtAndCraft artAndCraft) {
        ArtAndCraft savedArtAndCraft = artAndCraftRepository.save(artAndCraft);
        return new ResponseEntity<>(savedArtAndCraft, HttpStatus.CREATED);
    }

    @PutMapping("/{id}")
    public ResponseEntity<ArtAndCraft> updateArtAndCraft(@PathVariable Long id, @RequestBody ArtAndCraft artAndCraft) {
        Optional<ArtAndCraft> existingArtAndCraft = artAndCraftRepository.findById(id);
        if (existingArtAndCraft.isPresent()) {
            ArtAndCraft updatedArtAndCraft = existingArtAndCraft.get();
            updatedArtAndCraft.setTitle(artAndCraft.getTitle());
            updatedArtAndCraft.setDescription(artAndCraft.getDescription());
            updatedArtAndCraft.setPrice(artAndCraft.getPrice());
            ArtAndCraft savedArtAndCraft = artAndCraftRepository.save(updatedArtAndCraft);
            return new ResponseEntity<>(savedArtAndCraft, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<ArtAndCraft> deleteArtAndCraft(@PathVariable Long id) {
        Optional<ArtAndCraft> existingArtAndCraft = artAndCraftRepository.findById(id);
        if (existingArtAndCraft.isPresent()) {
            artAndCraftRepository.deleteById(id);
            return new ResponseEntity<>(existingArtAndCraft.get(), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
}