package com.webapp.lab6.controllers;

import com.webapp.lab6.models.Program;
import com.webapp.lab6.repository.ProgramRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/programs")
public class ProgramController {

    @Autowired
    private ProgramRepository programRepository;

    // Lấy danh sách tất cả Program
    @GetMapping
    public List<Program> getAllPrograms() {
        return programRepository.findAll();
    }

    // Lấy Program theo id
    @GetMapping("/{id}")
    public ResponseEntity<Program> getProgramById(@PathVariable int id) {
        Optional<Program> program = programRepository.findById(id);
        return program.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    // Tạo mới Program
    @PostMapping
    public Program createProgram(@RequestBody Program program) {
        return programRepository.save(program);
    }

    // Cập nhật Program theo id
    @PutMapping("/{id}")
    public ResponseEntity<Program> updateProgram(@PathVariable int id, @RequestBody Program programDetails) {
        Optional<Program> program = programRepository.findById(id);
        if (program.isPresent()) {
            Program existingProgram = program.get();
            existingProgram.setName(programDetails.getName());
            existingProgram.setDuration(programDetails.getDuration());
            existingProgram.setVersion(programDetails.getVersion());
            existingProgram.setMajorId(programDetails.getMajorId());
            existingProgram.setProgramTypeId(programDetails.getProgramTypeId());
            existingProgram.setValidFrom(programDetails.getValidFrom());
            return ResponseEntity.ok(programRepository.save(existingProgram));
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    // Xóa Program theo id
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteProgram(@PathVariable int id) {
        Optional<Program> program = programRepository.findById(id);
        if (program.isPresent()) {
            programRepository.delete(program.get());
            return ResponseEntity.ok().build();
        } else {
            return ResponseEntity.notFound().build();
        }
    }
}