
Data_006_638F::
    db   $1E, $02, $1E, $62, $1E, $42, $1E, $22, $32, $00, $32, $20, $30, $00, $30, $20

GopongaProjectileEntityHandler::
    ld   hl, wEntitiesHealthTable                 ; $639F: $21 $60 $C3
    add  hl, bc                                   ; $63A2: $09
    ld   [hl], $30                                ; $63A3: $36 $30
    ld   hl, wEntitiesPrivateState1Table          ; $63A5: $21 $B0 $C2
    add  hl, bc                                   ; $63A8: $09
    ld   a, [hl]                                  ; $63A9: $7E
    and  a                                        ; $63AA: $A7
    jr   z, jr_006_63B5                           ; $63AB: $28 $08

    ldh  a, [hFrameCounter]                       ; $63AD: $F0 $E7
    rla                                           ; $63AF: $17
    rla                                           ; $63B0: $17
    and  $10                                      ; $63B1: $E6 $10
    ldh  [$FFED], a                               ; $63B3: $E0 $ED

jr_006_63B5:
    ld   de, Data_006_638F                        ; $63B5: $11 $8F $63
    call RenderActiveEntitySpritesPair            ; $63B8: $CD $C0 $3B
    call GetEntityTransitionCountdown             ; $63BB: $CD $05 $0C
    jr   z, jr_006_63CE                           ; $63BE: $28 $0E

    dec  a                                        ; $63C0: $3D
    jp   z, ClearEntityStatus_06                  ; $63C1: $CA $DB $65

    rra                                           ; $63C4: $1F
    rra                                           ; $63C5: $1F
    rra                                           ; $63C6: $1F
    and  $01                                      ; $63C7: $E6 $01
    add  $02                                      ; $63C9: $C6 $02
    jp   SetEntitySpriteVariant                   ; $63CB: $C3 $0C $3B

jr_006_63CE:
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $63CE: $21 $10 $C4
    add  hl, bc                                   ; $63D1: $09
    ld   a, [hl]                                  ; $63D2: $7E
    cp   $02                                      ; $63D3: $FE $02
    jr   c, jr_006_63DD                           ; $63D5: $38 $06

    call GetEntityTransitionCountdown             ; $63D7: $CD $05 $0C
    ld   [hl], $10                                ; $63DA: $36 $10
    ret                                           ; $63DC: $C9

jr_006_63DD:
    ld   [hl], b                                  ; $63DD: $70
    call func_006_64C6                            ; $63DE: $CD $C6 $64
    ldh  a, [hFrameCounter]                       ; $63E1: $F0 $E7
    rra                                           ; $63E3: $1F
    rra                                           ; $63E4: $1F
    rra                                           ; $63E5: $1F
    and  $01                                      ; $63E6: $E6 $01
    call SetEntitySpriteVariant                   ; $63E8: $CD $0C $3B
    call label_3B39                               ; $63EB: $CD $39 $3B
    call func_006_6541                            ; $63EE: $CD $41 $65
    jp   func_006_5E54                            ; $63F1: $C3 $54 $5E
